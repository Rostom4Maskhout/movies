import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/widget/custom_elevated_button.dart';
import 'package:movies_app/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../provider/app_language_provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isVisiblePassword = true;
  bool isVisibleConfirmPassword = true;
  List<String> avatars = [
    AppAssets.avatar2,
    AppAssets.avatar1,
    AppAssets.avatar3,
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          },
            icon: Icon(Icons.arrow_back,
              color: AppColors.yellowColor,),),
          title: Text(AppLocalizations.of(context)!.register,
              style: AppStyles.regular16Yellow),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: height * 0.03,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: height * 0.2,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.5,
                        viewportFraction: 0.35,
                        enableInfiniteScroll: false,
                      ),
                      items: avatars.map((avatar) {
                        return CircleAvatar(
                          radius: 60,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(avatar),
                          ),
                        );
                      }).toList(),
                    ),
                    Center(
                      child: Text(AppLocalizations.of(context)!.avatar,
                        style: AppStyles.regular16White,),
                    ),
                  ],
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  hintText: AppLocalizations.of(context)!.name,
                  hintStyle: AppStyles.regular16White,
                  prefixIcon: ImageIcon(AssetImage(AppAssets.nameIcon)),
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  hintText: AppLocalizations.of(context)!.email,
                  hintStyle: AppStyles.regular16White,
                  prefixIcon: ImageIcon(AssetImage(AppAssets.emailIcon),
                  ),

                ),
                CustomTextField(
                    filled: true,
                    fillColor: AppColors.greyColor,
                    hintText: AppLocalizations.of(context)!.password,
                    hintStyle: AppStyles.regular16White,
                    prefixIcon: ImageIcon(AssetImage(AppAssets.passwordIcon)),
                    obscureText: isVisiblePassword,
                    maxLines: 1,
                    obscuringCharacter: '*',
                    suffixIcon: IconButton(
                        onPressed: () {
                          isVisiblePassword = !isVisiblePassword;
                          setState(() {

                          });
                        },
                        icon: Icon(isVisiblePassword ?
                        Icons.visibility_off_rounded : Icons.visibility,
                          color: AppColors.whiteColor,
                        )
                    )
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  hintText: AppLocalizations.of(context)!.confirm_password,
                  hintStyle: AppStyles.regular16White,
                  prefixIcon: ImageIcon(AssetImage(AppAssets.passwordIcon)),
                  obscureText: isVisibleConfirmPassword,
                  maxLines: 1,
                  obscuringCharacter: '*',
                  suffixIcon: IconButton(
                      onPressed: () {
                        isVisibleConfirmPassword = !isVisibleConfirmPassword;
                        setState(() {

                        });
                      },
                      icon: Icon(isVisibleConfirmPassword ?
                      Icons.visibility_off_rounded : Icons.visibility,
                        color: AppColors.whiteColor,
                      )
                  ),
                ),
                CustomTextField(
                  filled: true,
                  fillColor: AppColors.greyColor,
                  hintText: AppLocalizations.of(context)!.phone_number,
                  hintStyle: AppStyles.regular16White,
                  prefixIcon: ImageIcon(AssetImage(AppAssets.phoneIcon)),
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  backgroundColor: AppColors.yellowColor,
                  child: Text(AppLocalizations.of(context)!.create_account,
                    style: AppStyles.regular20Black,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.already_have_account,
                      style: AppStyles.regular14White,),
                    TextButton(
                        onPressed: () {},
                        child: Text(AppLocalizations.of(context)!.login,
                          style: AppStyles.regular14Yellow,)
                    ),
                  ],
                ),
                Center(
                  child: Container(
                      width: width * 0.25,
                      height: height * 0.05,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: AppColors.yellowColor,
                              width: 2
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          chooseFlagItem(
                            flagAsset: AppAssets.america,
                            languageCode: 'en',
                            provider: languageProvider,
                          ),
                          chooseFlagItem(
                            flagAsset: AppAssets.egypt,
                            languageCode: 'ar',
                            provider: languageProvider,
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(height: height * 0.02,)
              ],
            ),
          ),
        )
    );
  }

  Widget chooseFlagItem({
    required String flagAsset,
    required String languageCode,
    required AppLanguageProvider provider,
  }) {
    return InkWell(
      onTap: () {
        provider.changeLanguage(languageCode);
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: provider.appLanguage == languageCode ?
            AppColors.yellowColor : Colors.transparent,
            width: 4,
          ),
        ),
        child: Image.asset(
          flagAsset,
        ),
      ),
    );
  }
}
