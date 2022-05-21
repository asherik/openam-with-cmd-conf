FROM penidentityplatform/openam

ENV SSOADMINTOOLS_PATH /home/openam/ssoadmintools

ENV CONFIGURATOR_TOOL_VERSION 14.6.4

RUN apt install -y curl zip unzip && \
mkdir ${SSOADMINTOOLS_PATH} && \
curl https://github.com/OpenIdentityPlatform/OpenAM/releases/download/${CONFIGURATOR_TOOL_VERSION}/SSOAdminTools-${CONFIGURATOR_TOOL_VERSION}.zip --output ${SSOADMINTOOLS_PATH} && \
unzip ${SSOADMINTOOLS_PATH}/SSOAdminTools-14.6.4.zip -d ${SSOADMINTOOLS_PATH}  && \
chmod -R 777 ${SSOADMINTOOLS_PATH}

ADD ./openamconfig ${SSOADMINTOOLS_PATH}/openamconfig
RUN chmod 777 ${SSOADMINTOOLS_PATH}/openamconfig

#install config
java -jar  ${SSOADMINTOOLS_PATH}/openam-configurator-tool-${CONFIGURATOR_TOOL_VERSION}.jar -f ${SSOADMINTOOLS_PATH}/openamconfig