FROM travisci/ci-garnet:packer-1503972846

ENV PATH /home/travis/.evm/bin:$PATH
RUN git clone https://github.com/rejeep/evm.git /home/travis/.evm
RUN evm config path /tmp
