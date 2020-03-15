#R sobre Debian buster usando la imagen
#rocker/tidyverse
# Descarga de la imagen
FROM rocker/tidyverse
LABEL MAINTAINER="Ledyn moreno <ledyncas95@correo.ugr.es>"

# Se actualiza dependencias
RUN apt-get update -y --no-install-recommends

#Se instalan las librerias segun el metodo
#recomendado por el autor de la imagen 
#ver apartado notas en https://hub.docker.com/r/rocker/tidyverse/

ENV R_PACKAGES="\
   caret \
   RSNNS \
   frbs \
   FSinR \
   forecast"

RUN install2.r --error \
      --deps R_PACKAGES \
	  && rm -rf /tmp/downloaded_packages \
	  && apt-get clean \
	  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Crea usuario local
#RUN useradd --create-home ruser
#WORKDIR /home/ruser
#USER ruser
	
#EXPOSE 8787
CMD ["/init"]
