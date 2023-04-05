# Utiliza la imagen oficial de Python 3.8 como punto de partida
FROM python:3.8

# Instala las dependencias necesarias para Docker y Docker Compose
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io \
    && curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose \
    && rm -rf /var/lib/apt/lists/*

# Instala las dependencias necesarias para dbt-core, pgcli y git
RUN apt-get update && apt-get install -y git build-essential libssl-dev libffi-dev python-dev \
    && rm -rf /var/lib/apt/lists/*

# Clona el repositorio de dbt-core desde GitHub y establece el directorio de trabajo en /dbt
WORKDIR /dbt
RUN git clone https://github.com/dbt-labs/dbt-core.git /dbt

# Instala las dependencias de dbt-core y pgcli
RUN pip install -r /dbt/requirements.txt pgcli

# Define el comando por defecto para ejecutar dbt
CMD ["dbt"]
