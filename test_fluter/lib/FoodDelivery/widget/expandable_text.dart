import 'package:flutter/material.dart';
import 'package:test_fluter/FoodDelivery/utils/colors.dart';
import 'package:test_fluter/FoodDelivery/utils/dimensions.dart';
import 'package:test_fluter/FoodDelivery/widget/small_text.dart';

class ExpandableText extends StatefulWidget{
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableText createState() => _ExpandableText();

}

class _ExpandableText extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  IconData iconShowMore = Icons.arrow_drop_down_outlined;
  String textShowMore = "Hiện thêm";

  double textHeight = Dimension.screenHeight/8.67;

  @override
  void initState(){
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
      child: secondHalf.isEmpty?SmallText(height: 1.7,color: AppColors.paraColor,text: firstHalf):Column(
        children: [
          SmallText(height: 1.7,color: AppColors.paraColor,text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;
                if(hiddenText){
                   iconShowMore = Icons.arrow_drop_down_outlined;
                   textShowMore = "Hiện thêm";
                }else{
                  iconShowMore = Icons.arrow_drop_up;
                  textShowMore = "Thu Gọn";
                }
              });
            },
            child: Row(
              children: [
                SmallText(text: textShowMore,color: AppColors.mainColor,size: 16,),
                Icon(iconShowMore,color: AppColors.mainColor,size: 16,)
              ],
            ),
          )
        ],
      ),
    );
  }
}