FROM mosnamarek/arm32-toolchain:8.3

LABEL maintainer="marek.mosna@prusa3d.cz"

ENV STM32F4_DIR=/stm32f4
RUN mkdir ${STM32F4_DIR}
WORKDIR ${STM32F4_DIR}

# Install STM32 Cube sources
ARG STM32F4SOURCES_TARBALL_URL="https://github.com/STMicroelectronics/STM32CubeF4/archive/v1.25.2.tar.gz"
RUN wget ${STM32F4SOURCES_TARBALL_URL} 
RUN export STM32F4SOURCES_TARBALL_FILENAME=$(basename "${STM32F4SOURCES_TARBALL_URL}") \
	&& tar -xvf ${STM32F4SOURCES_TARBALL_FILENAME} \
    && mv `tar -tf ${STM32F4SOURCES_TARBALL_FILENAME} | head -1 | cut -f1`* ${STM32F4_DIR} \
    && rm ${STM32F4SOURCES_TARBALL_FILENAME} \
    && rm -rf Projects Documentation Utilities

WORKDIR /work

