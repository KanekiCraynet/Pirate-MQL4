**Dokumentasi Expert Advisor (EA) "Pirate" untuk Forex Market**

### **Gambaran Umum**
EA "Pirate" dirancang untuk trading otomatis di platform MetaTrader 4 (MT4) dengan fokus pada pasangan mata uang tertentu. EA ini menggunakan manajemen risiko, kontrol spread, dan waktu trading untuk memaksimalkan potensi profit.

---

### **Fitur Utama**
1. **Manajemen Risiko Otomatis**  
   - Menghitung lot berdasarkan persentase risiko dan ekuitas akun.
   - Opsi menggunakan lot tetap atau dinamis.

2. **Kontrol Waktu Trading**  
   - Hanya beroperasi dalam jam yang ditentukan (`StartHour` hingga `StopHour`).

3. **Filter Spread**  
   - Membatalkan order jika spread melebihi batas yang diizinkan (`MaxSpreadOpen`).

4. **Strategi Berbasis Indikator**  
   - Menggunakan RSI (Relative Strength Index) dan Moving Average (MA) untuk sinyal entry/exit.

5. **Take Profit & Stop Loss Dinamis**  
   - Menyesuaikan level TP/SL berdasarkan kondisi pasar.

6. **Multi-Bahasa**  
   - Mendukung notifikasi dalam bahasa Rusia dan Inggris.

---

### **Instalasi**
1. Salin file `.ex4` ke folder:  
   `...\MT4\MQL4\Experts`
2. Restart MT4 atau refresh Navigator.
3. Tempelkan EA ke chart pasangan yang direkomendasikan:
   - CHFJPY, EURCHF, EURAUD, USDCHF, USDCAD.

---

### **Parameter Input**
| Parameter | Deskripsi | Contoh Nilai |
|-----------|-----------|--------------|
| **Money Management** |
| `MoneyManagement` | Aktifkan manajemen risiko | `true`/`false` |
| `Risk` | Persentase risiko per trade | `3` (3%) |
| `OriginalLot` | Lot tetap (jika MoneyManagement=false) | `0.1` |
| **Order Settings** |
| `CountBuy` | Jumlah maksimal order BUY | `1` |
| `CountSell` | Jumlah maksimal order SELL | `1` |
| `TakeProfit` | Target profit (dalam points) | `20` |
| `StopLoss` | Batas rugi (dalam points) | `35` |
| **Time Settings** |
| `StartHour` | Jam mulai trading (0-23) | `0` (00:00) |
| `StopHour` | Jam berhenti trading (0-23) | `1` (01:00) |
| **Advanced** |
| `MaxSpreadOpen` | Spread maksimal untuk open order | `30` points |
| `TakeProfitClose` | Auto-close saat profit mencapai X points | `5` |

---

### **Catatan Penting**
1. **Magic Number**  
   EA menggunakan `181818` sebagai ID order. Pastikan tidak ada konflik dengan EA lain.

2. **Dependensi**  
   - Pastikan terminal mengizinkan trading otomatis (AutoTrading enabled).
   - Gunakan akun dengan leverage minimal 1:100.

3. **Rekomendasi**  
   - Backtest di data historis sebelum digunakan live.
   - Monitor performa saat pertama kali dijalankan.

---

### **Pemecahan Masalah**
- **Error 133**: Trading tidak diizinkan. Periksa:
  - Apakah akun terhubung ke server trading.
  - Apakah simbol diperbolehkan untuk trading.
- **Spread Melebar**: EA akan menunda order sampai spread normal.

---

### **Lisensi**
Kode ini bersifat open-source dan gratis. Namun, tanggung jawab penggunaan sepenuhnya ada pada pengguna.

⚠️ **Disclaimer**: Trading forex mengandung risiko tinggi. Hasil sebelumnya tidak menjamin kinerja masa depan.

---

**Link Support**: [Telegram Channel](https://t.me/zeenotjee)  
**Versi Terbaru**: 1.20  
**Kompatibilitas**: MetaTrader 4
