import 'package:flutter/material.dart';
class CustomeTextInputField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function(String value)? onSubmitted;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator; // Corrected the type of the validator function



  const CustomeTextInputField(
      {Key? key, this.label, this.hintText, this.focusNode, this.controller, this.onSubmitted,this.validator, this.keyboardType, this.obscureText})
      : super(key: key);

  @override
  State<CustomeTextInputField> createState() => _CustomeTextInputFieldState();
}

class _CustomeTextInputFieldState extends State<CustomeTextInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Text(
              widget.label!, style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            cursorColor: Colors.black,
            obscureText: widget.obscureText ?? false,
            controller: widget.controller,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onSubmitted,
            validator: widget.validator,
            keyboardType:widget.keyboardType ,
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              hintText: "${widget.hintText}",
              hintStyle: TextStyle(
                  color: const Color(0xff013053).withOpacity(0.75),
                  fontWeight: FontWeight.w300,
                  fontSize: 12),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                      color: const Color(0xff6f706f).withOpacity(0.3))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  borderSide: BorderSide(
                      color: const Color(0xff6f706f).withOpacity(0.3))),
            ),
          ),
        ],
      ),
    );
  }
}
