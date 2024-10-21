import 'package:drfootapp/controllers/articles_controller.dart';
import 'package:drfootapp/utils/utility.dart';
import 'package:drfootapp/utils/widgets/custom_button.dart';
import 'package:drfootapp/utils/widgets/custom_circular_loader.dart';
import 'package:drfootapp/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class CreateArticle extends StatefulWidget {
  const CreateArticle({super.key});

  @override
  State<CreateArticle> createState() => _CreateArticleState();
}

class _CreateArticleState extends State<CreateArticle> {
  ArticlesController articlesController = Get.put(ArticlesController());
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticlesController>(builder: (articlesController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Articles & Blog"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: articlesController.pickFile,
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                ),
                                child: articlesController.xFile != null
                                    ? Image.network(
                                        articlesController.xFile!.path)
                                    : const Icon(Icons.image),
                              ),
                            ),
                            TextButton(
                                onPressed: articlesController.pickFile,
                                child: const Text("Pick image")),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            MyTextField(
                              hint: "Title",
                              textEditingController:
                                  articlesController.titleTextEditingController,
                              maxLength: 1000,
                              textInputType: TextInputType.text,
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(),
                                ],
                              ),
                            ),
                            submitButton()
                          ],
                        ),
                      ),
                    ],
                  ),
                  HtmlEditor(
                    controller:
                        articlesController.htmlEditorController, //required
                    htmlToolbarOptions: const HtmlToolbarOptions(
                      toolbarPosition: ToolbarPosition.belowEditor, //by default
                      toolbarType: ToolbarType.nativeScrollable, //by default
                    ),
                    htmlEditorOptions: const HtmlEditorOptions(
                      hint: "Your text here...",

                      //initalText: "text content initial, if any",
                    ),
                    otherOptions: const OtherOptions(
                      height: 300,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget submitButton() {
    return articlesController.isLoading
        ? const CustomCircularLoader()
        : CustomButton(
            onPress: () async {
              bool status = _formKey.currentState!.saveAndValidate();
              if (status) {
                String text =
                    await articlesController.htmlEditorController.getText();
                if (articlesController.xFile == null) {
                  Utility.toast("select image");
                } else if (text.isEmpty) {
                  Utility.toast("Enter descrption");
                } else {
                  // Utility.showAlertDialogger(
                  //     yes: () async {
                  //       Get.back();
                  articlesController.createArticle();
                  // },
                  // no: () {
                  //   Navigator.pop(context);
                  //   Get.back();
                  // },
                  // context: context);
                }
              }
            },
            buttonName: "Create",
          );
  }
}
