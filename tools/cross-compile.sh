cd ..

mkdir -p binaries
mkdir -p micro-$1

cp LICENSE micro-$1
cp README.md micro-$1

HASH="$(git rev-parse --short HEAD)"

# Mac
echo "OSX 64"
GOOS=darwin GOARCH=amd64 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-osx.tar.gz micro-$1
mv micro-$1-osx.tar.gz binaries

# Linux
echo "Linux 64"
GOOS=linux GOARCH=amd64 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-linux64.tar.gz micro-$1
mv micro-$1-linux64.tar.gz binaries
echo "Linux 32"
GOOS=linux GOARCH=386 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-linux32.tar.gz micro-$1
mv micro-$1-linux32.tar.gz binaries
echo "Linux arm"
GOOS=linux GOARCH=arm go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-linux-arm.tar.gz micro-$1
mv micro-$1-linux-arm.tar.gz binaries

# NetBSD
echo "NetBSD 64"
GOOS=netbsd GOARCH=amd64 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-netbsd64.tar.gz micro-$1
mv micro-$1-netbsd64.tar.gz binaries
echo "NetBSD 32"
GOOS=netbsd GOARCH=386 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-netbsd32.tar.gz micro-$1
mv micro-$1-netbsd32.tar.gz binaries

# OpenBSD
echo "OpenBSD 64"
GOOS=openbsd GOARCH=amd64 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-openbsd64.tar.gz micro-$1
mv micro-$1-openbsd64.tar.gz binaries
echo "OpenBSD 32"
GOOS=openbsd GOARCH=386 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-openbsd32.tar.gz micro-$1
mv micro-$1-openbsd32.tar.gz binaries

# FreeBSD
echo "FreeBSD 64"
GOOS=freebsd GOARCH=amd64 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-freebsd64.tar.gz micro-$1
mv micro-$1-freebsd64.tar.gz binaries
echo "FreeBSD 32"
GOOS=freebsd GOARCH=386 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro ./cmd/micro
tar -czf micro-$1-freebsd32.tar.gz micro-$1
mv micro-$1-freebsd32.tar.gz binaries

rm micro-$1/micro

# Windows
echo "Windows 64"
GOOS=windows GOARCH=amd64 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro.exe ./cmd/micro
zip -r -q -T micro-$1-win64.zip micro-$1
mv micro-$1-win64.zip binaries
echo "Windows 32"
GOOS=windows GOARCH=386 go build -ldflags "-X main.Version=$1 -X main.CommitHash=$HASH -X 'main.CompileDate=$(date -u '+%B %d, %Y')'" -o micro-$1/micro.exe ./cmd/micro
zip -r -q -T micro-$1-win32.zip micro-$1
mv micro-$1-win32.zip binaries

rm -rf micro-$1
