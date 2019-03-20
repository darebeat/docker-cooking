## README

```sh
# flink cluster run
docker-compose up

# Scale the cluster up or down to N TaskManagers:

docker-compose scale taskmanager=<N>
```

##

mvn archetype:generate								\
  -DarchetypeGroupId=org.apache.flink				\
  -DarchetypeArtifactId=flink-quickstart-java		\
  -DarchetypeVersion=${1:-1.7.0}							\
  -DgroupId=org.darebeat.flink					\
  -DartifactId=flink								\
  -Dversion=0.1										\
  -Dpackage=org.darebeat.flink					\
  -DinteractiveMode=false
