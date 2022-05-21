FROM penidentityplatform/openam

ENV SSOADMINTOOLS_PATH /home/openam/ssoadmintools

RUN apt install -y curl && \
mkdir ${SSOADMINTOOLS_PATH} && \
curl https://github.com/OpenIdentityPlatform/OpenAM/releases/download/14.6.4/SSOAdminTools-14.6.4.zip --output ${SSOADMINTOOLS_PATH} && \
chmod -R 777 ${SSOADMINTOOLS_PATH}

ADD ./openamconfig ${SSOADMINTOOLS_PATH}/openamconfig
RUN chmod 777 ${SSOADMINTOOLS_PATH}/openamconfig

#install config


