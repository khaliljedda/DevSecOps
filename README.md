
### Implemented approch
The main goal of this project is to define the best practices across different technologies for including performance and security engineering in the DevOps pipeline.

![image](https://user-images.githubusercontent.com/46020280/201217831-0c9370f0-c30b-4b96-8cf9-70202a5fe318.png)

* Automate application integration and deployment to a staging environment by using a CI/CD pipeline.

* Multistage delivery pipeline with quality gates that automate the performance and the security test and automate the evaluation before go live.

* Monitoring system to check the reliability of the application

### Architecture
In section, we will give an overview of the implemented solution for the CI/CD stream. The flow can be explained through the following steps:

![image](https://user-images.githubusercontent.com/46020280/201218153-68206dde-b891-40ab-969b-a97564b55fe7.png)
 
1. Push code changes

2. Build project

3. Execute test unit

4. Check code security 

5  Build and push the docker image

6. Deploy to test environment

7. Execute Load and performance tests

8. Monitor the test environment

9. Quality Gates:  compare results to NFRs and validate

10. Go live



11. Monitor production environment

### Run the reference application with docker compose

1. Clone the repo
   ```sh
   git clone https://github.com/khaliljedda/DevSecOps.git
   ```
2. Run With Docker Compose 
   ```sh
   sudo docker-compose up
   ```

3. Open your browser at :


         http://localhost:4200/

