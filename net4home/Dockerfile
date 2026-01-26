ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install required packages for Debian 12 (aarch64) binary
# The binary was compiled for Debian 12 Raspberry Pi 64-bit, so we need Debian-compatible libraries
# Required libraries: libconfig.so.9, libblkid.so.1
# Required interpreter: /lib/ld-linux-aarch64.so.1

# First, detect the base OS
RUN echo "Detecting base OS..." && \
    (cat /etc/os-release 2>/dev/null || echo "OS release not found") && \
    (test -f /etc/alpine-release && echo "Alpine detected" || echo "Not Alpine") && \
    (test -f /etc/debian_version && echo "Debian detected" || echo "Not Debian") || true

RUN \
    if [ -f /etc/alpine-release ]; then \
        echo "Installing packages for Alpine Linux..." && \
        apk update && \
        apk add --no-cache \
            jq \
            file \
            libc6-compat \
            libstdc++ \
            libgcc \
            libconfig-dev \
            libconfig \
            util-linux-libs \
            util-linux \
            || (echo "Package installation failed, trying alternative..." && \
                apk add --no-cache \
                    jq \
                    file \
                    libc6-compat \
                    libstdc++ \
                    libgcc \
                    util-linux-libs \
                    || true); \
        echo "Verifying libconfig installation..." && \
        find /usr/lib* /lib* -name "libconfig.so*" 2>/dev/null | head -5 || echo "libconfig not found"; \
        echo "Verifying libblkid installation..." && \
        find /usr/lib* /lib* -name "libblkid.so*" 2>/dev/null | head -5 || echo "libblkid not found"; \
        # Create symlink for aarch64 interpreter if it doesn't exist
        if [ ! -f /lib/ld-linux-aarch64.so.1 ]; then \
            mkdir -p /lib && \
            (ln -s /lib/ld-musl-aarch64.so.1 /lib/ld-linux-aarch64.so.1 2>/dev/null || \
             ln -s /lib64/ld-linux-aarch64.so.1 /lib/ld-linux-aarch64.so.1 2>/dev/null || \
             true); \
        fi; \
    elif [ -f /etc/debian_version ]; then \
        echo "Installing packages for Debian/Ubuntu..." && \
        apt-get update && \
        apt-get install -y --no-install-recommends \
            jq \
            file \
            binutils \
            libc6 \
            libc6-dev \
            libstdc++6 \
            libgcc-s1 \
            libconfig9 \
            libblkid1 \
            util-linux \
            ca-certificates \
            && rm -rf /var/lib/apt/lists/*; \
        echo "Verifying libconfig installation..." && \
        find /usr/lib* /lib* -name "libconfig.so*" 2>/dev/null | head -5 || echo "libconfig not found"; \
        echo "Verifying libblkid installation..." && \
        find /usr/lib* /lib* -name "libblkid.so*" 2>/dev/null | head -5 || echo "libblkid not found"; \
        # Ensure interpreter exists (should be in libc6 package)
        if [ ! -f /lib/ld-linux-aarch64.so.1 ] && [ ! -f /lib64/ld-linux-aarch64.so.1 ]; then \
            echo "WARNING: Interpreter not found, trying to locate..." && \
            find /lib* -name "ld-linux-aarch64.so*" 2>/dev/null | head -1 | while read interp; do \
                mkdir -p /lib && \
                ln -s "$interp" /lib/ld-linux-aarch64.so.1; \
            done || true; \
        fi; \
        # Ensure libconfig.so.9 exists (create symlink if needed)
        if [ ! -f /usr/lib/aarch64-linux-gnu/libconfig.so.9 ] && [ ! -f /lib/aarch64-linux-gnu/libconfig.so.9 ]; then \
            find /usr/lib* /lib* -name "libconfig.so*" 2>/dev/null | head -1 | while read lib; do \
                mkdir -p /usr/lib/aarch64-linux-gnu /lib/aarch64-linux-gnu 2>/dev/null || true; \
                ln -sf "$lib" /usr/lib/aarch64-linux-gnu/libconfig.so.9 2>/dev/null || \
                ln -sf "$lib" /lib/aarch64-linux-gnu/libconfig.so.9 2>/dev/null || true; \
            done || true; \
        fi; \
        # Ensure libblkid.so.1 exists (create symlink if needed)
        if [ ! -f /usr/lib/aarch64-linux-gnu/libblkid.so.1 ] && [ ! -f /lib/aarch64-linux-gnu/libblkid.so.1 ]; then \
            find /usr/lib* /lib* -name "libblkid.so*" 2>/dev/null | head -1 | while read lib; do \
                mkdir -p /usr/lib/aarch64-linux-gnu /lib/aarch64-linux-gnu 2>/dev/null || true; \
                ln -sf "$lib" /usr/lib/aarch64-linux-gnu/libblkid.so.1 2>/dev/null || \
                ln -sf "$lib" /lib/aarch64-linux-gnu/libblkid.so.1 2>/dev/null || true; \
            done || true; \
        fi; \
    else \
        # Fallback - try to install basic tools
        echo "Unknown base OS, attempting to install basic tools..." && \
        (apk add --no-cache jq file libconfig util-linux-libs libc6-compat 2>/dev/null || \
         apt-get update && apt-get install -y --no-install-recommends jq file libconfig9 libblkid1 libc6 && rm -rf /var/lib/apt/lists/* 2>/dev/null || \
         true); \
    fi

# Copy service binary and startup script
COPY rootfs/ /
COPY run.sh /run.sh

# Set executable permissions
RUN chmod a+x /usr/bin/n4hSvc /run.sh || true
RUN chmod a+x /usr/bin/HSTime 2>/dev/null || true
RUN chmod a+x /usr/bin/HSpr 2>/dev/null || true

# Set the startup script as entrypoint
CMD ["/run.sh"]

# Labels
LABEL \
    io.hass.name="net4home Server" \
    io.hass.description="Add-on für den net4home Server (n4hSvc)" \
    io.hass.type="addon" \
    io.hass.version="1.0.6" \
    io.hass.arch="aarch64|amd64|armv7|armhf"
