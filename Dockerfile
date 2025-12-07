FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libglfw3-dev \
    libglew-dev \
    libglm-dev \
    libgl1-mesa-dev \
    xorg-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy project files
COPY . .

# Create build directory and build
RUN mkdir -p build && cd build && \
    cmake .. && \
    cmake --build .

# Set entry point
ENTRYPOINT ["./build/BlackHole3D"]
