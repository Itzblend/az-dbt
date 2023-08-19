FROM python:3.10.12-bookworm

WORKDIR /app

COPY requirements.txt requirements.txt

COPY dn_dbt dn_dbt

RUN python -m pip install --upgrade pip

RUN pip install -r requirements.txt

WORKDIR /app/dn_dbt

CMD ["dbt", "build", "--target", "prod", "--profiles-dir", "/app/dn_dbt"]