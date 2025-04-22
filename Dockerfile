FROM python:3.10-alpine
RUN apk add gcc build-base python3-dev openssl-dev musl-dev libffi-dev g++ make rrdtool
COPY requirements.txt /opt/RRDReST/requirements.txt
WORKDIR /opt/RRDReST
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY . /opt/RRDReST
ENTRYPOINT ["uvicorn", "rrdrest:rrd_rest"]
CMD ["--host", "0.0.0.0", "--port", "9000"]
