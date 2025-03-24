# Basit Hesap Makinesi (Lex & Yacc Kullanarak)
Elif Yıldız

Bu proje, Lex (Flex) ve Yacc (Bison) kullanarak bir basit hesap makinesi uygulaması geliştirmektedir. Hesap makinesi şu işlemleri destekler: 

★ Aritmetik işlemler: +, -, *, /

★ Parantezli ifadeler

★ Hata yönetimi (örneğin, sıfıra bölme hatası)

# Tasarım Kararları

## Lexical Analiz (Lex - calculator.l):

★ NUMBER (sayı), +, -, *, / ve parantezleri ((, )) tanıyacak şekilde token (sembol) kuralları yazılmıştır.

★ Boşluklar ve satır sonları gibi gereksiz karakterler göz ardı edilmiştir.

★ Tanımlanan token'lar Yacc'e gönderilir, burada işlenip hesaplama yapılır.

## Parçalama ve Değerlendirme (Yacc - calculator.y):

★ Aritmetik ifadeler için gramer kuralları uygulanır.

★ Öncelik kuralları belirlenmiştir; örneğin * ve / işlemleri, + ve - işlemlerinden önce gelir.

★ Unary minus (örneğin -5) düzgün çalışacak şekilde tanımlanmıştır.

★ Sıfıra bölme hatası kontrol edilir ve uygun bir hata mesajı gösterilir.

★ Hesaplama işlemleri özyinelemeli olarak yapılır.

## Kurulum ve Derleme

Hesap makinesini derlemek ve çalıştırmak için aşağıdaki adımları takip edebilirsiniz:

lex calculator.l         # lex.yy.c dosyasını oluşturur

yacc -d calculator.y     # y.tab.c ve y.tab.h dosyalarını oluşturur

gcc lex.yy.c y.tab.c -o calculator -lm  # Derlemeyi tamamlar

./calculator             # Hesap makinesini çalıştırır
