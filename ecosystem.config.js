module.exports = {
    apps: [
      {
        name: "aws-ec2-rds-nodejs-app",
        script: "./server.js",
        watch: true,
        env: {
          NODE_ENV: "development",
          PORT: 3000,
        },
        env_production: {
          NODE_ENV: "production",
          PORT: 8080,
        },
      },
    ],
  };