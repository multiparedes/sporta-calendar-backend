# Etapa de construcción
FROM node:18-alpine AS build

WORKDIR /app

# Copia los archivos de dependencias e instala
COPY package*.json ./
RUN npm install

# Copia el resto de los archivos
COPY . .

# Genera el cliente de Prisma
RUN npx prisma generate --schema=src/prisma/schema.prisma

# Imagen final
FROM node:18-alpine

WORKDIR /app

# Copia los archivos generados de la etapa de construcción
COPY --from=build /app /app

# Expone el puerto definido en .env (Ej. 8000)
EXPOSE 8000

# Comando para iniciar la aplicación
CMD ["sh", "-c", "npm run start"]