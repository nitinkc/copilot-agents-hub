---
name:  React/TypeScript Copilot Instructions
title:  React/TypeScript Code Quality & Compliance Instructions
description: Consolidated, actionable guidance for React 18+ / TypeScript 5+ codebases covering security, privacy, IP/licensing, supply chain, quality, and AI-generated code review. Complements the canonical baseline and must not weaken it.
applyTo: ["**/*.ts","**/*.tsx","**/*.jsx","**/*.js","package.json","tsconfig.json",".security-metadata.yaml"]
priority: 100
version: 1.0
lastUpdated: 2026-01-27
owner: EDTS-Security-And-Quality
tags: ["react","typescript","security","privacy","quality","copilot"]
---

# GitHub Copilot Instructions: ReactJS/TypeScript Code Quality Analysis

## Instruction Precedence
- Extends `.github/copilot-instructions.md` and MUST NOT weaken it.
- Complements AI guidance in `.github/instructions/security_context.instructions.md`.

## Security Analysis Guidelines

### 1. Credential and Secret Detection
CRITICAL: Do not bundle secrets client-side.
- Client-bundled env patterns: `REACT_APP_*`, `NEXT_PUBLIC_*` are exposed in the browser; only use for non-sensitive config.
- Keep secrets server-side (secure APIs, httpOnly cookies, secret management).
Check for:
- API keys/tokens/passwords in code, URLs with credentials, private keys/certs, DB strings with creds, OAuth client secrets, cloud access keys, exposed envs.
Action Items:
- Flag hardcoded credentials; ensure `.env` is ignored; verify no sensitive values in client bundle.

### 2. Input Validation and Sanitization
- Validate user inputs; avoid `dangerouslySetInnerHTML` unless sanitized.
- If unavoidable, sanitize with vetted libraries (e.g., DOMPurify):
```tsx
import DOMPurify from 'dompurify';
export function SafeHtml({ html }: { html: string }) {
  return <div dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(html) }} />;
}
```

### 2.1 Dynamic Code Execution (Forbidden)
- Do not use `eval`, `new Function`, or string-based `setTimeout`/`setInterval`.
- Do not inject or execute scripts dynamically (e.g., via `innerHTML` or creating `<script>` tags from user data).
- Do not `import()` or load scripts from untrusted/variable URLs.
- Only load code from trusted, static sources vetted at build time.

### 3. Authentication, Cookies & CSRF
- Prefer httpOnly cookies with `Secure` and `SameSite=strict|lax`.
- Do not store auth tokens in `localStorage` or `sessionStorage`; use httpOnly cookies.
- Use CSRF tokens (double-submit or header-based) for mutating requests.

**Example: Safe Cookie Configuration**
```typescript
// Server API route (e.g., Express)
res.setHeader('Set-Cookie', [
  `session=${token}; HttpOnly; Secure; SameSite=Strict; Path=/; Max-Age=3600`
]);
```

**Example: CSRF Header-Based Pattern**
```typescript
// Client-side: Include CSRF token in custom header
const response = await fetch('/api/update', {
  method: 'POST',
  credentials: 'include',
  headers: {
    'Content-Type': 'application/json',
    'X-CSRF-Token': csrfToken, // Token from meta tag or cookie
  },
  body: JSON.stringify(data),
});
```

### 4. API Security
- Always use HTTPS, minimum TLS 1.2
- Return generic errors (no internal details).
- Encode parameters/inputs appropriately.
- Use type-safe APIs.


### 5. Content Security Policy (CSP)
- Recommend baseline: `default-src 'self'; script-src 'self'; style-src 'self'; img-src 'self' data:; connect-src 'self'; object-src 'none'; frame-ancestors 'none';`.
- Use nonces or hashes for any inline scripts/styles; do not use `'unsafe-inline'`.
- Do not rely on CSP via meta tags; set CSP via HTTP response headers only (note: `frame-ancestors` is ignored in meta).
- Document exceptions in ADR; avoid wildcards and broad `unsafe-*`.

**Example: CSP Header (server middleware)**
```typescript
res.setHeader('Content-Security-Policy',
  "default-src 'self'; script-src 'self'; style-src 'self'; img-src 'self' data:; connect-src 'self'; object-src 'none'; frame-ancestors 'none'"
);
```

### 6. Third-Party Scripts & Assets
- Require Subresource Integrity (SRI) for CDN scripts/styles (`integrity` + `crossorigin`).
- Prefer self-hosted assets; avoid inline event handlers.

### 7. Logging & Telemetry
- Structured logging with redaction; no PII/secrets.
- Configure telemetry SDK scrubbing (e.g., Sentry/Bugsnag) to remove sensitive fields/URLs.

**Example: Structured Logging with Redaction**
```typescript
const logger = {
  info: (msg: string, meta?: Record<string, unknown>) => {
    const sanitized = meta ? redactSensitive(meta) : {};
    console.log(JSON.stringify({ level: 'info', msg, ...sanitized }));
  },
};

function redactSensitive(obj: Record<string, unknown>): Record<string, unknown> {
  const sensitive = ['password', 'token', 'ssn', 'email', 'apiKey'];
  return Object.fromEntries(
    Object.entries(obj).map(([k, v]) => 
      sensitive.some(s => k.toLowerCase().includes(s)) ? [k, '[REDACTED]'] : [k, v]
    )
  );
}
```

**Example: Sentry Scrubbing**
```typescript
import * as Sentry from '@sentry/react';

Sentry.init({
  beforeSend(event) {
    // Scrub PII from breadcrumbs and request data
    if (event.request?.url) {
      event.request.url = event.request.url.replace(/email=[^&]+/, 'email=[REDACTED]');
    }
    return event;
  },
});
```

### 8. Dependency & Supply Chain Integrity
- Commit lockfiles; avoid forced installs.
- Audit regularly; review post-install scripts; remove unused deps.

## Privacy & Data Protection
- Treat all user data as sensitive; do not log PII.
- Classify data (L1/L2) and enforce TLS; minimize collection. See `infrastructure-instructions/security_context.instructions.md` for L1/L2 definitions and scope.
- Ensure `.security-metadata.yaml` matches actual data flows and handling.

## Code Quality & React/TS Best Practices

### TypeScript Standards
- Use strict mode in `tsconfig.json`; avoid `any`; prefer explicit types.
- Use generics for reusable components; leverage `React.ComponentProps<typeof Component>` for prop extraction.

### Hooks Patterns
- **useEffect**: Include all dependencies; return cleanup functions to prevent leaks.
```typescript
useEffect(() => {
  const subscription = api.subscribe();
  return () => subscription.unsubscribe(); // Cleanup
}, [api]); // All dependencies
```
- **Custom Hooks**: Extract reusable stateful logic.
```typescript
function useAuth() {
  const [user, setUser] = useState<User | null>(null);
  // ... auth logic
  return { user, login, logout };
}
```

### State Management
- **useState**: Local component state.
- **useReducer**: Complex state logic with multiple sub-values or next state depends on previous.
- **Context**: Share state across component trees without prop drilling.
- **External State**: Use Redux Toolkit, Zustand, or Jotai for global app state.
- **Server State**: Use React Query or SWR for fetching, caching, synchronizing server data.

### Component Design
- Single responsibility; <200 lines; test in isolation.
- Composition over inheritance; use `children` and render props.
- Proper prop validation with TypeScript interfaces.

### Error Boundaries
```typescript
class ErrorBoundary extends React.Component<{children: React.ReactNode}, {hasError: boolean}> {
  state = { hasError: false };
  static getDerivedStateFromError() { return { hasError: true }; }
  componentDidCatch(error: Error, info: React.ErrorInfo) {
    console.error('Error caught:', error, info);
  }
  render() {
    if (this.state.hasError) return <h1>Something went wrong.</h1>;
    return this.props.children;
  }
}
```

### Performance
- Use `React.memo` for expensive pure components.
- Code splitting: `React.lazy` + `Suspense`.
- `useMemo`/`useCallback` for expensive computations or stable references in dependency arrays.
- Prefer dynamic imports and tree-shaking-friendly module structure; avoid re-exporting entire libraries.
- Virtualize long lists (e.g., windowing) to minimize DOM nodes and memory.
- Use `useTransition`/`useDeferredValue` for UI responsiveness under heavy updates.
- Use React DevTools Profiler to identify hot spots.

### Accessibility
- Semantic HTML; proper ARIA attributes and roles.
- Keyboard navigation for all interactive elements; focus management.
- Color contrast ratios; test with screen readers.
- Use `eslint-plugin-jsx-a11y`; enforce a11y lint rules in CI.

### Styling
- Consistent, themeable styles using CSS Modules or CSS-in-JS; prefer design tokens for colors, spacing, and typography.
- Respect `prefers-color-scheme`; ensure dark/light themes maintain accessibility contrast.
- Avoid global leakage; scope styles to components; use BEM or module scoping where appropriate.
- Minimize inline styles except for dynamic values; avoid `!important` overrides.

### Routing
- Lazy-load route bundles; split large feature areas to reduce initial payload.
- Implement protected routes with server-side authorization; client checks are supplemental only.
- Preserve scroll and focus on navigation; provide accessible skip links.
- Provide clear 404/500 routes and error pages; avoid leaking internals.

### Forms & Validation
- Prefer controlled components for predictable state; debounce expensive validations.
- Use schema-based validation for complex forms (e.g., Yup/Zod) and surface accessible errors.
- Prevent over-posting; validate and sanitize before submission; limit file upload types/sizes server-side.
- Support keyboard-only interaction; ensure labels, descriptions, and error text are announced.

### Data Fetching
- Cancel stale requests (e.g., `AbortController`) to avoid race conditions and wasted work.
- Use optimistic updates and rollback on failure where appropriate; avoid flashing states.
- Apply retries with backoff for transient errors; dedupe concurrent requests.
- Cache and revalidate server state based on freshness.

## Compliance & IP/Licensing
- Verify license compatibility; avoid viral/incompatible licenses (AGPL, GPL without compatibility); no excluded repos.
- Prefer original implementations; add attribution where permitted.
- Use tooling and generate SBOM in CI.

**License Check Commands**
```bash
# List all licenses
npx license-checker --production --csv > licenses.csv

# Fail on incompatible licenses
npx license-checker --production --failOn "GPL;AGPL;LGPL"

# Allow only specific licenses
npx license-checker --production --onlyAllow "MIT;Apache-2.0;BSD-2-Clause;BSD-3-Clause;ISC"
```

**SBOM Generation**
```bash
# Generate SBOM (CycloneDX format)
npm sbom --sbom-format cyclonedx > sbom.json

# Or using @cyclonedx/cyclonedx-npm
npx @cyclonedx/cyclonedx-npm --output-file sbom.json
```

**CI Integration**: Add license checks to GitHub Actions or CI pipeline; fail builds on incompatible licenses.

## Responsible AI Usage (Generated Code)
- Review AI-generated code; never accept security/crypto suggestions blindly.
- Add `// Reviewed: 2026-01-27` (or current date) for critical blocks.

## Testing & Reporting

### Testing Requirements
- **Coverage**: Critical components require 100% line coverage; non-critical default ≥80%. Auth/payment flows always 100%.
 
#### Test Frameworks
- **E2E**: Cypress or Playwright (team standard).
- **Accessibility**: `axe-core` integration via `@axe-core/playwright` or `cypress-axe`.

#### Critical Components Definition & Enforcement

- **Definition**: Components/flows are “critical” if they affect any of:
  - Security/privacy: authN/Z, session/cookies/CSRF, output sanitization, CSP, PII/L1–L2 data.
  - Financial/commitment: payments/checkout, orders, refunds, loyalty balance, gift cards.
  - Regulatory/compliance: consent, data subject rights, telemetry redaction, license/SBOM gates.
  - Operational blast radius: app shell/global nav, routing/guards, safety/feature gates.
  - Privileged/admin: admin consoles, destructive ops, cross-tenant boundaries, data export/import.
  - External exposure: public APIs/SDK entry points, webhooks, 3rd-party script loaders.
- **Declaration**: Maintain a canonical list in `.security-metadata.yaml` using glob patterns (e.g., `src/auth/**`, `src/payments/**`). PRs adding new critical areas must update this list.
- **Enforcement**: Apply per-path coverage thresholds in CI; require unit + E2E + a11y + security tests for critical areas.

```js
// jest.config.js (example)
module.exports = {
  collectCoverage: true,
  coverageThreshold: {
    global: { lines: 80, statements: 80, branches: 70, functions: 80 },
    './src/auth/**': { lines: 100, statements: 100, branches: 100, functions: 100 },
    './src/payments/**': { lines: 100, statements: 100, branches: 100, functions: 100 },
  },
};
```

**Example: E2E Test (Cypress)**
```typescript
describe('Login Flow', () => {
  it('authenticates user with valid credentials', () => {
    cy.visit('/login');
    cy.findByLabelText(/email/i).type('user@example.com');
    cy.findByLabelText(/password/i).type('secret');
    cy.findByRole('button', { name: /login/i }).click();
    cy.url().should('include', '/dashboard');
  });

  it('meets accessibility standards', () => {
    cy.visit('/login');
    cy.injectAxe();
    cy.checkA11y(); // Requires cypress-axe
  });
});
```

**Example: E2E Test (Playwright)**
```typescript
import { test, expect } from '@playwright/test';
import AxeBuilder from '@axe-core/playwright';

test('authenticates user with valid credentials', async ({ page }) => {
  await page.goto('/login');
  await page.getByLabel(/email/i).fill('user@example.com');
  await page.getByLabel(/password/i).fill('secret');
  await page.getByRole('button', { name: /login/i }).click();
  await expect(page).toHaveURL(/.*dashboard/);
});

test('meets accessibility standards', async ({ page }) => {
  await page.goto('/login');
  const results = await new AxeBuilder({ page }).analyze();
  expect(results.violations).toEqual([]);
});
```

  **Example: Network Mocking (Cypress)**
  ```typescript
  describe('Products API', () => {
    it('renders products from mocked API', () => {
      cy.intercept('GET', '/api/products', {
        statusCode: 200,
        body: [{ id: '1', name: 'Latte' }, { id: '2', name: 'Mocha' }],
      }).as('getProducts');
      cy.visit('/products');
      cy.wait('@getProducts');
      cy.findByText(/Latte/).should('exist');
      cy.findByText(/Mocha/).should('exist');
    });
  });
  ```

  **Example: Network Mocking (Playwright)**
  ```typescript
  import { test, expect } from '@playwright/test';

  test('renders products from mocked API', async ({ page }) => {
    await page.route('**/api/products', async route => {
      await route.fulfill({
        status: 200,
        contentType: 'application/json',
        body: JSON.stringify([
          { id: '1', name: 'Latte' },
          { id: '2', name: 'Mocha' },
        ]),
      });
    });
    await page.goto('/products');
    await expect(page.getByText(/Latte/)).toBeVisible();
    await expect(page.getByText(/Mocha/)).toBeVisible();
  });
  ```

**Example: XSS Security Test**
```typescript
// Cypress
cy.get('[data-testid="user-content"]').should('not.contain.html', '<script>');

// Playwright
const maliciousHTML = '<img src=x onerror=alert(1)>';
await page.evaluate((html) => {
  document.querySelector('[data-testid="user-content"]').innerHTML = html;
}, maliciousHTML);
const scripts = await page.locator('script').count();
expect(scripts).toBe(0); // Sanitized
```

### Reporting
- Provide structured analysis with severity (Critical/High/Medium/Low), file references, remediation, and positive findings.

## Quick PR Checklist
- **Data**: No L1/L2 in code, tests, logs, or prompts.
- **Security**: Inputs validated; outputs sanitized; secrets externalized; CSP via headers (no 'unsafe-inline'; use nonce/hash); CSRF enforced; no `REACT_APP_*`/`VITE_*`/`NEXT_PUBLIC_*` with secrets; no tokens in localStorage/sessionStorage; no `eval`/`new Function` or dynamic script injection.
- **Assets**: SRI on CDN assets; no inline event handlers.
- **Privacy**: Redaction applied; `.security-metadata.yaml` aligned with actual data flows.
- **IP/Licensing**: Compatible deps; SBOM/licensing checks in CI; no excluded code.
- **Exclusions**: Exclusions List compliance verified (see https://my.project/github-copilot-exclusions).
- **Tests**: Critical areas 100% coverage; default ≥80%; XSS/auth/a11y tests added.
- **Accessibility**: eslint-plugin-jsx-a11y enabled in lint config/CI; axe checks passing.
- **Docs**: Public API docs updated; complex logic commented.
- **Bundle**: Run `npx source-map-explorer build/static/js/*.js` to verify no secrets in bundle.

## Red Flags (Immediate)
Hardcoded secrets, PII logging, XSS/SQLi, unprotected sensitive routes, tokens in localStorage, missing `.security-metadata.yaml`, `eval`/`dangerouslySetInnerHTML`, vulnerable dependencies, exposed env vars (`REACT_APP_*`, `VITE_*`, `NEXT_PUBLIC_*`), excluded code reuse, custom crypto.

## Version Info
- Document Version: 1.0
 - Last Updated: January 27, 2026
- Applies to: React 18+, TypeScript 5+