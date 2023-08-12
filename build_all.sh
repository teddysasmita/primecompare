v . -prod
mv primecompare v_main
zig build-exe main.zig -lc -O ReleaseSmall
rm main.o
mv main zig_main
nim c -d:release --opt:speed -o:nim_main main.nim
