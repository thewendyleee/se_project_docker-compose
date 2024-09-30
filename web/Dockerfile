# image
FROM python:3.8-slim

# setting workdir and copy to container
WORKDIR /web
COPY . /web/

# install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# change workdir for following commands
WORKDIR /web/se_project

# the data for sharing between host and multi containers
VOLUME /web

# 增加可讀性，知道是 8000 port
EXPOSE 8000

# container 啟動時執行的指令
ENTRYPOINT [ "/bin/bash", "entrypoint.sh" ]

# container 啟動時 default 執行的指令，可以當作 ENTRYPOINT 的補充，如果執行的時候有其他 command 會覆蓋掉 CMD
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# 因為使用 gunicorn 所以改成以下，上面的 python runserver 是開發用的，生產時用 gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "se_project.wsgi:application"]