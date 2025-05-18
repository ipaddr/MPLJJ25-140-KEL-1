import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureNew = true;
  bool _obscureConfirm = true;
  String? _errorText;

  bool get _isPasswordValid {
    final password = _newPasswordController.text;
    return password.length >= 6 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[a-z]').hasMatch(password);
  }

  void _resetPassword() {
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      _errorText = null;
    });

    if (newPassword != confirmPassword) {
      setState(() {
        _errorText = 'The password confirmation doesn’t match';
      });
      return;
    }

    if (!_isPasswordValid) {
      setState(() {
        _errorText = 'Password must include min 6 characters, uppercase & lowercase';
      });
      return;
    }

    // TODO: Hubungkan ke backend untuk menyimpan password baru
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password successfully reset!')),
    );

    Navigator.pushNamed(context, '/login');
  }

  Widget _buildPasswordField({
    required String hint,
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback toggleVisibility,
    bool showError = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: showError ? Colors.red : Colors.transparent,
          width: 1.4,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
            onPressed: toggleVisibility,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildCriteriaRow() {
    final password = _newPasswordController.text;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCheckItem(password.length >= 6, 'Min 6 characters'),
        _buildCheckItem(RegExp(r'[A-Z]').hasMatch(password), 'Uppercase'),
        _buildCheckItem(RegExp(r'[a-z]').hasMatch(password), 'Lowercase'),
      ],
    );
  }

  Widget _buildCheckItem(bool passed, String text) {
    return Row(
      children: [
        Icon(
          passed ? Icons.check_circle : Icons.cancel,
          color: passed ? Colors.teal : Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: passed ? Colors.teal : Colors.grey,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: const Color(0xFF26413C)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'New Password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Serif',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Create a strong password for updating\nj***********i@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24),

              // New Password
              _buildPasswordField(
                hint: 'New Password',
                controller: _newPasswordController,
                obscure: _obscureNew,
                toggleVisibility: () => setState(() {
                  _obscureNew = !_obscureNew;
                }),
              ),
              const SizedBox(height: 12),
              _buildCriteriaRow(),
              const SizedBox(height: 16),

              // Confirm Password
              _buildPasswordField(
                hint: 'Confirm Password',
                controller: _confirmPasswordController,
                obscure: _obscureConfirm,
                toggleVisibility: () => setState(() {
                  _obscureConfirm = !_obscureConfirm;
                }),
                showError: _errorText != null,
              ),

              if (_errorText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 16),
                      const SizedBox(width: 6),
                      Text(
                        _errorText!,
                        style: const TextStyle(color: Colors.red, fontSize: 13),
                      ),
                    ],
                  ),
                ),

              const Spacer(),

              // Reset Password Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _resetPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF26413C),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Serif',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
