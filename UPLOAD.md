# RTool katalogini GitHub'ga yuklash (bir marta bosish)

Repo tayyor: **github.com/Islomumarov36/rtool-catalog** (bo'sh bo'lishi kerak).

## Yuklash — bitta qadam
1. Shu papkadagi **`catalog-push.bat`** ni ikki marta bosing.
2. Birinchi marta GitHub **login oynasi** chiqsa — hisobingiz bilan kiring/avtorizatsiya qiling.
3. "Tayyor" chiqsa — bo'ldi. Tekshirish:
   - https://github.com/Islomumarov36/rtool-catalog
   - https://raw.githubusercontent.com/Islomumarov36/rtool-catalog/main/catalog.json
   - https://raw.githubusercontent.com/Islomumarov36/rtool-catalog/main/MultiUnlock.apk

Bu `catalog.json` + 4 APK ni repo'ga yuboradi. RTool shu manzillardan yuklab oladi
(Release shart emas — raw fayl ishlatiladi).

## Keyin
RTool'ni qayta **build** qiling (kod shu hisobingizga qaratilgan). Endi istalgan
kompyuterdagi RTool APKlarni internetdan oladi, 404 yo'qoladi.

## Agar push "rejected" bo'lsa
Repo bo'sh emas degani (README qo'shilgan). Menga ayting — tuzatib beraman
(yoki repo Settings'dan README'ni o'chirib, qayta bosing).

## APKni kelajakda yangilash
Yangi APK ni shu papkaga qo'ying, `catalog.json` dagi mos `sha256` ni yangilang,
`catalog-push.bat` ni qayta bosing. RTool'ni qayta build qilish shart emas.
