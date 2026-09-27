FROM python:3.13-bookworm

RUN apt update

RUN apt install -y libgl1

WORKDIR /server

COPY requirements.txt /server/

RUN pip install --no-cache-dir --upgrade -r /server/requirements.txt

COPY . /server

EXPOSE 8000

CMD ["uvicorn", "api.app:app", "--host", "0.0.0.0", "--port", "8000"]