# Composition Root

This phase introduces a Composition Root to centralize dependency wiring.

Purpose:
- Prevent UI from instantiating infrastructure classes directly.
- Keep application layer decoupled from concrete implementations.
- Enable future dependency injection (testing, mocks, server adapters).

Pattern:
UI → Composition Root → Application Use Case → Repository Port → Infrastructure Adapter

Rules:
- UI imports only from src/composition
- Application never imports infrastructure
- Infrastructure never imports UI

This solidifies Clean Architecture layering for acquisition-grade maintainability.
