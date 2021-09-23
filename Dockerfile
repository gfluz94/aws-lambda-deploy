FROM public.ecr.aws/lambda/python:3.7

COPY main.py requirements.txt ./

RUN python3.7 -m pip install -r requirements.txt -t .

CMD ["main.lambda_handler"]