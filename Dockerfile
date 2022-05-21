FROM openidentityplatform/openam
USER root
ENV SSOADMINTOOLS_PATH /home/openam/ssoadmintools

ENV CONFIGURATOR_TOOL_VERSION 14.6.4

ENV CONFIGURATOR_ZIP_PATH ${SSOADMINTOOLS_PATH}/SSOConfiguratorTools-${CONFIGURATOR_TOOL_VERSION}.zip

WORKDIR ${SSOADMINTOOLS_PATH}

RUN apt update && apt install -y curl zip unzip netcat

RUN curl -L https://github.com/OpenIdentityPlatform/OpenAM/releases/download/${CONFIGURATOR_TOOL_VERSION}/SSOConfiguratorTools-${CONFIGURATOR_TOOL_VERSION}.zip -o ${CONFIGURATOR_ZIP_PATH}

RUN unzip ${CONFIGURATOR_ZIP_PATH} -d ${SSOADMINTOOLS_PATH}  && \
chmod -R 777 ${SSOADMINTOOLS_PATH} && \
rm -f ${CONFIGURATOR_ZIP_PATH}

ADD ./openamconfig ${SSOADMINTOOLS_PATH}/openamconfig
RUN chmod -R 777 ${SSOADMINTOOLS_PATH}/openamconfig

ADD ./configure.sh /configure.sh
RUN chmod 777 /configure.sh

ADD ./starter.sh /starter.sh
RUN chmod 777 /starter.sh

USER $OPENAM_USER

CMD ["/bin/bash", "/starter.sh"]