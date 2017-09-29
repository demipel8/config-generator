# Config Generator

The idea behind this project is very simple: Load a template file and a json file to create a valid file. It must be agnostic to the file type it's working with.

Story map: https://www.featuremap.co/public/dussman/config-generator
Stories board: https://trello.com/b/bFhJnKo9/generate-config-file-stories
Technical backlog: https://trello.com/b/MpL7zTOz/generate-config-file-technical-backlog

**Input**

```yaml
  apiVersion: extensions/v1beta1
  kind: Deployment
    metadata:
      name: mongodb-backup
      namespace: apps
    spec:
      replicas: {{number_of_replicas}}
      template:
        spec:
          containers:
            - name: {{container_name}}
              image: {{image}}
              env:
              - name: MONGODB_HOST
                value: "{{db_host}}"
              - name: MONGODB_PORT
                value: "{{db_port}}"
              - name: MONGODB_NAME
                value: "{{db_name}}"
              - name: BACKUP_FOLDER
                value: "{{backup_folder}}"
```

```json
  {
    "number_of_replicas": 1,
    "container_name": "mongodb",
    "image": "mongo",
    "db_host": "mongodb",
    "db_port": "27017",
    "db_name": "temp_db",
    "backup_folder": "/dev/null",
  }
```

**Output**

```yaml
  apiVersion: extensions/v1beta1
  kind: Deployment
    metadata:
      name: mongodb-backup
      namespace: apps
    spec:
      replicas: 1
      template:
        spec:
          containers:
            - name: mongodb
              image: mongo
              env:
              - name: MONGODB_HOST
                value: "mongodb"
              - name: MONGODB_PORT
                value: "27017"
              - name: MONGODB_NAME
                value: "temp_db"
              - name: BACKUP_FOLDER
                value: "/dev/null"
```