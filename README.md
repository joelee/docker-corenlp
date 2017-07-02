# Stanford CoreNLP Web API Server

This is a Docker container for running the [Web API Server](https://stanfordnlp.github.io/CoreNLP/corenlp-server.html) for [Stanford CoreNLP](https://stanfordnlp.github.io/CoreNLP/index.html).
---
## Usage
```bash
docker run --name corenlp -p 9000:9000 -d joeworks/corenlp-server
``` 
---
## Support for other language model
By default the 'english' [language model](https://stanfordnlp.github.io/CoreNLP/download.html) is included. If you wish to add another supported languages, you have 2 options:

### Download Language Model
Add `-e "LANGUAGE=language-name"` option in your `docker run`. For example to include the 'chinese' language model:
```bash
docker run --name corenlp -p 9000:9000 -d -e "LANGUAGE=chinese" joeworks/corenlp-server
``` 

### Use JARs in your host folder
Map your host folder to `/corenlp/model` by adding `-v /path/to/host:/corenlp/model` option in your `docker run`. For example:
```bash
docker run --name corenlp -v /opt/corenlp/jars:/corenlp/model -d -e "LANGUAGE=chinese" joeworks/corenlp-server
```
---

[GitHub](https://github.com/joelee/docker-corenlp) | [DockerHub](https://hub.docker.com/r/joeworks/corenlp-server/) | [Slack](https://joeworks.slack.com/messages/C63JZTTBQ)