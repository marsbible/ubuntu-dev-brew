FROM ubuntu:16.04

MAINTAINER kevin ma <redshift@outlook.com>

RUN apt-get update \
  && apt-get install -y build-essential gdb python sudo curl file git vim openssl \
  && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
  && useradd --create-home --shell /bin/bash linuxbrew -G sudo \
  && echo "linuxbrew:linuxbrew" | chpasswd \
  && apt-get clean

USER linuxbrew 
WORKDIR /home/linuxbrew

# x86_64 only
ENV CFLAGS="-march=sandybridge"
ENV CXXFLAGS="-march=sandybridge"

ENV HOMEBREW_EDITOR vim
ENV LANG en_US.utf8
ENV LC_ALL en_US.UTF-8
ENV HOMEBREW_NO_AUTO_UPDATE=1
ENV ACLOCAL_PATH /home/linuxbrew/.linuxbrew/share/aclocal
ENV CMAKE_INSTALL_PREFIX /home/linuxbrew/.linuxbrew
ENV CMAKE_PREFIX_PATH /home/linuxbrew/.linuxbrew
ENV CMAKE_INCLUDE_PATH /home/linuxbrew/.linuxbrew/include
ENV CMAKE_LIBRARY_PATH /home/linuxbrew/.linuxbrew/lib
ENV PKG_CONFIG_PATH /usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH
ENV LINUXBREWHOME /home/linuxbrew/.linuxbrew
ENV PATH $LINUXBREWHOME/bin:$PATH
ENV MANPATH $LINUXBREWHOME/man:$MANPATH
ENV PKG_CONFIG_PATH $LINUXBREWHOME/lib64/pkgconfig:$LINUXBREWHOME/lib/pkgconfig:$PKG_CONFIG_PATH


RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" \
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/fbthrift/Formula/gflags.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/gflags.rb \
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/fbthrift/Formula/glog.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/glog.rb \  
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/folly-fix/Formula/double-conversion.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/double-conversion.rb \
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/folly-fix/Formula/folly.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/folly.rb \
  && brew install gcc \
  && brew install jemalloc \
  && brew install folly \
  && brew install gperf \
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/fbthrift/Formula/rsocket-cpp.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/rsocket-cpp.rb \
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/fbthrift/Formula/fmt.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/fmt.rb \
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/fbthrift/Formula/fizz.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/fizz.rb \
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/fbthrift/Formula/wangle.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/wangle.rb \
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/fbthrift/Formula/fbthrift.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/fbthrift.rb \
  && curl -fsSL https://raw.githubusercontent.com/marsbible/linuxbrew-core/fbthrift/Formula/proxygen.rb -o /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/homebrew/homebrew-core/Formula/proxygen.rb \
  && brew install fbthrift \
  && brew install proxygen

