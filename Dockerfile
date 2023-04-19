from maven as dev
workdir /app
copy . .
run mvn install

from openjdk:11.0
workdir /app
copy --from=dev /app/target/devops-integration.jar /app/
expose 80
cmd ["java","-jar","devops-integration.jar"]
