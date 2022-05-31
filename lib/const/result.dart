import 'package:sbselector/const/snowboard.dart';
import 'package:sbselector/model/result.dart';
import 'package:sbselector/model/snowboard.dart';

const resultMap = {
  'grandTrickJib': {
    'rideType': 'ジブ・グラトリ',
    'discription':
        'あなたは雪の上でスピンやジャンプなどのグランドトリックをしたり、アイテムの上を滑るスケートボードのようなライドスタイルに興味があるようです。そんな人にはエッジが引っかかりにくいフラットキャンバーや板の反発をもらいやすいダブルキャンバーのような形状のボードがおすすめ！！',
  },
  'freerunPowder': {
    'rideType': 'フリーラン・パウダー',
    'discription':
        'あなたは圧雪バーンでカービングターンをしたり、パウダースノーで浮遊感を感じたり、壁などを使った地形遊びをするライドスタイルに興味があるようです。そんな人には雪面にエッジが上手くかかるキャンバー、板のノーズが雪に埋まりにくいロッカーキャンバーのような形状の板がおすすめ！！',
  },
  'allRround': {
    'rideType': 'オールラウンド',
    'discription':
        'あなたはスノーボードを遊び尽くしたい、オールラウンドなライドに興味があるようです。そんな人にはハイブリッドキャンバー、ハイブリッドキャンバーのようなロッカー・キャンバー・フラットなどの形状を取り入れた、どんな滑りでも対応できるボードがおすすめ！！',
  },
};

Result createResultData(String rideType) {
  print('resultData作成');
  print(rideType);
  Map<String, dynamic> resultData = resultMap[rideType] as Map<String, dynamic>;
  List<Snowboard> snowboardData = createSnowboardData(rideType);
  final Result result = Result(
    rideType: resultData['rideType'],
    firstRecommendBoard: snowboardData.first,
    secondRecommendBoard: snowboardData.last,
    discription: resultData['discription'],
  );

  return result;
}
// }
