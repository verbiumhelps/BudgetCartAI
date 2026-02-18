# Auth Security Regression

## Cases
- Expired session token should force re-auth
- Invalid/garbled session should clear local state
- Refresh token failures should not loop indefinitely
- Password reset links must be single-use (server-side)

## Notes
- Implement E2E once navigation/screens are wired.

