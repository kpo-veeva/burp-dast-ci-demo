# Burp Suite DAST CI-driven Scanning Demonstration
This repository demonstrates Burp Suite DAST's CI-driven scanning functionality, using OWASP Juice Shop as a target application. It wraps the Burp scanning of Juice Shop into standard development pipelines to show how it integrates into a developer's normal working flow. This project exists to demonstrate how your organisation can adopt DevSecOps and the shift-left methodology. 

> All configuration was correct as of the last commit to this repository.

## Repository Structure
- **`app/`** - Contains the complete OWASP Juice Shop vulnerable web application
- **`.github/`** - GitHub Actions workflow configurations for automated pipeline execution
- **`.gitlab-ci.yml`** - GitLab CI pipeline configuration
- **`azure-pipelines.yml`** - Azure DevOps pipeline configuration  
- **`.burp/`** - Burp Suite configuration
- **`.scripts/`** - Relevant cleanup scripts needed for complete execution of the pipelines

## How It Works
The pipelines are designed to:

1. **Build**: compile and containerize the Juice Shop application
2. **Test**: execute unit tests, UI tests, and integration tests *(note: tests are mocked for demonstration purposes)*
3. **Deploy**: run the application locally in a containerized environment
4. **Scan**: perform automated security testing using Burp Suite against the running application
5. **Publish**: once the scan has completed, the results from the Burp scan, alongside those from the UI, integration and unit tests, are published into the pipeline as JUnit test results. This means that you can see Burp's scan results in the pipeline in the same way as the results from usual code tests. With a bit of configuration, it would be possible to convert Burp's scan results to the relevant format to those required for some system's security dashbaords, e.g. SARIF for GitHub's, or GitLab's JSON schema.

Because this application is scanned on localhost before it is deployed to any server, the vulnerabilities are captured early on in the development cycle, reducing the number that can be exploited by bad actors.

Each CI/CD platform (GitHub Actions, GitLab CI, Azure DevOps) follows the same workflow pattern but uses platform-specific syntax and features.

## Important Notes
- **Mock Testing**: The unit, UI, and integration tests are simulated/mocked for demonstration purposes and do not represent real test coverage
- **Local Scanning**: Security scans are performed against a locally running instance of the built application
- **Educational Purpose**: This setup is intended for learning and demonstrating security pipeline integration

## License & Attribution
OWASP Juice Shop is licensed under the MIT License. For full license details, attribution requirements, and project information, please refer to the original project:

- **Project Repository**: https://github.com/juice-shop/juice-shop
- **Official Documentation**: https://pwning.owasp-juice.shop
- **OWASP Project Page**: https://owasp.org/www-project-juice-shop/

This repository builds upon and extends the original Juice Shop project for CI/CD security pipeline demonstration purposes.