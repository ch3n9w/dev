FROM archlinux:latest

COPY . /root/dev
WORKDIR /root/dev
# RUN sed -i 's/^Server =.*archlinux.org$/Server = https:\/\/mirrors.tuna.tsinghua.edu.cn\/archlinux\/\$repo\/os\/\$arch/' /etc/pacman.d/mirrorlist
RUN pacman -Sy && pacman -S --needed --noconfirm sudo
RUN echo 'o' | bash ./scripts/install-software.sh
RUN nvim --headless "+Lazy! sync" +qa
RUN nvim --headless "+MasonToolsInstallSync" +qa
WORKDIR /root
RUN rm -r /root/dev

CMD [ "/bin/zsh" ]
