#Image de base
FROM rocketchat/rocket.chat

#Copie du script de personnalisation dans le conteneur
COPY customize.sh /usr/local/bin/customize.sh

#Permissions d'exécution du script
RUN chmod +x /usr/local/bin/customize.sh
RUN mkdir -p /app/bundle/programs/web.browser/app/tmp

#Exécution du script au lancement du conteneur
CMD ["/bin/bash", "-c", "/usr/local/bin/customize.sh"]

