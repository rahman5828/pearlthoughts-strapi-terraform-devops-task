export default ({ env }) => ({
  auth: {
    secret: env('ADMIN_AUTH_SECRET', 'pearlthoughts-admin-fallback-secret'),
  },
  apiToken: {
    salt: env('API_TOKEN_SALT', 'pearlthoughts-api-fallback-salt'),
  },
  transfer: {
    token: {
      salt: env('TRANSFER_TOKEN_SALT', 'pearlthoughts-transfer-fallback-salt'),
    },
  },
});
