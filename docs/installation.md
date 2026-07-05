# Installation

Each Discord Handler implementation is self-contained in its own repository. Choose your preferred language and follow the instructions below.

## Prerequisites

- A Discord application and bot token ([Discord Developer Portal](https://discord.com/developers/applications))
- The appropriate runtime for your chosen language

## Language-Specific Setup

### JavaScript

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Js.git
cd Discord-Handler-Js
npm install
cp .env.example .env
# Edit .env with your token
npm start
```

### TypeScript

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Ts.git
cd Discord-Handler-Ts
npm install
cp .env.example .env
npm run dev
```

### Go

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Go.git
cd Discord-Handler-Go
go mod tidy
cp .env.example .env
go run ./src/
```

### Rust

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Rs.git
cd Discord-Handler-Rs
cp .env.example .env
cargo run --release
```

### Python

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Py.git
cd Discord-Handler-Py
pip install -r requirements.txt
cp .env.example .env
python src/main.py
```

### C#

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Cs.git
cd Discord-Handler-Cs
dotnet restore
cp .env.example .env
dotnet run
```

### Java

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Java.git
cd Discord-Handler-Java
cp .env.example .env
mvn clean compile
mvn exec:java -Dexec.mainClass="Main"
```

### Kotlin

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Kt.git
cd Discord-Handler-Kt
cp .env.example .env
gradle wrapper
./gradlew run
```

### C++

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Cpp.git
cd Discord-Handler-Cpp
cp .env.example .env
cmake -B build
cmake --build build
./build/Discord-Handler-Cpp
```

### Dart

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Dart.git
cd Discord-Handler-Dart
dart pub get
cp .env.example .env
dart run
```

### Ruby

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Rb.git
cd Discord-Handler-Rb
bundle install
cp .env.example .env
ruby src/main.rb
```

### Lua

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Lua.git
cd Discord-Handler-Lua
luarocks install discordia luasec luasocket dkjson
cp .env.example .env
lua src/main.lua
```

### PHP

```bash
git clone https://github.com/RealMtrx/Discord-Handler-Php.git
cd Discord-Handler-Php
composer install
cp .env.example .env
php src/main.php
```
