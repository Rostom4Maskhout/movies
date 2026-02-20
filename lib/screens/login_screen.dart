import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // الألوان النهائية حسب الصور اللي بعتها
  final Color bgColor = const Color(0xFF121312); // الخلفية الأساسية
  final Color fieldColor = const Color(0xFF282A28); // خلفية الحقول
  final Color primaryYellow = const Color(0xFFFFBB3B); // اللون الأصفر الذهبي
  final Color textColor = const Color(0xFFFFFFFF); // اللون الأبيض

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 50),

              // 1. اللوجو
              Image.asset('assets/images/logo.png', width: 120, height: 120),

              const SizedBox(height: 40),

              // 2. حقل الإيميل باستخدام الأيقونة vector.png
              _buildField("Email", 'assets/icons/vector.png'),

              const SizedBox(height: 16),

              // 3. حقل الباسورد باستخدام الأيقونات lock.png و eye.png
              _buildField(
                  "Password",
                  'assets/icons/lock.png',
                  suffix: 'assets/icons/eye.png',
                  isPass: true
              ),

              // رابط Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                      "Forget Password ?",
                      style: TextStyle(color: primaryYellow, fontSize: 13)
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 4. زرار الـ Login
              _buildButton("Login", Colors.black, primaryYellow),

              const SizedBox(height: 20),

              // 5. رابط Create One
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have Account ? ", style: TextStyle(color: textColor)),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                        "Create One",
                        style: TextStyle(color: primaryYellow, fontWeight: FontWeight.bold)
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // 6. الخطوط الصفراء حول كلمة OR (تم التعديل للأصفر)
              Row(
                children: [
                  Expanded(child: Divider(color: primaryYellow, thickness: 1.2, indent: 40, endIndent: 10)),
                  Text("OR", style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
                  Expanded(child: Divider(color: primaryYellow, thickness: 1.2, indent: 10, endIndent: 40)),
                ],
              ),

              const SizedBox(height: 30),

              // 7. زرار جوجل مع تصليح ظهور الأيقونة
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryYellow,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/google.png',
                        width: 24,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.g_mobiledata, size: 30, color: Colors.black),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                          "Login With Google",
                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 8. سويتش الأعلام (تم التعديل ليكون دوائر مظبوطة)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: primaryYellow, width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildFlagCircle('🇪🇬', true), // علم مصر
                    const SizedBox(width: 10),
                    _buildFlagCircle('🇱🇷', false), // علم ليبيريا
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ميثود بناء الحقول
  Widget _buildField(String hint, String icon, {String? suffix, bool isPass = false}) {
    return TextField(
      obscureText: isPass,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: fieldColor,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(icon, width: 20),
        ),
        suffixIcon: suffix != null
            ? Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(suffix, width: 20),
        )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none
        ),
      ),
    );
  }
  Widget _buildButton(String text, Color tColor, Color bColor) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
        ),
        onPressed: () {},
        child: Text(text, style: TextStyle(color: tColor, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
  Widget _buildFlagCircle(String flagEmoji, bool isActive) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white.withOpacity(0.15) : Colors.transparent,
      ),
      child: Text(
        flagEmoji,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}