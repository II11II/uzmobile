import 'dart:async';

/**
    @Author: Islomkhuja Akhrorov
    Created at:
 **/
import 'package:uzmobile/bloc/base/base_bloc.dart';
import 'package:uzmobile/model/service.dart';

class ServiceBloc extends BaseBloc {
  final _services = StreamController<List<Service>>();

  Stream<List<Service>> get services => _services.stream;

  void getServices() {
    _services.sink.add(<Service>[
      Service(
          titleUz: "4G LTE",
          titleRu: "4G LTE",
          descrRu: """
     4G LTE. Скорость до 70 Мбит/с. Uzmobile предлагает интернет 4-го поколения - 4G LTE по цене 3G! 4G LTE доступен на всех современных устройствах с 4G-модулем: смартфонах, планшетах, роутерах, модемах. 
      """,
          descrUz: """
           4G LTE -  70 Mbit/sgacha tezlik. 4G LTE 4G-modulga ega barcha zamonaviy qurilmalarda.
           """,

          codeApply: "tel://*111*2*7*1#",
          codeDeny: "tel://*111*2*7*2#"),
      Service(
          titleUz: "«Oila uchun» xizmati",
          titleRu: "Услуга «Для Семьи»",
          descrRu: """
     При активации услуги все исходящие звонки внутри группы – 0 сум, включенный лимит минут не расходуется. Группой являются все номера, оформленные на один договор.

2 100 сум
Неограниченный голосовой трафик внутри группы «Для Семьи»  
420 сум
Стоимость активации услуги
      """,
          descrUz: """
Guruh ichida barcha chiquvchi qo‘ng‘iroqlar – 0,00 so‘m

2 100 so‘m
«Oila uchun» xizmati guruhi ichida cheklanmagan ovozli trafik  
420 so‘m
Xizmatni faollashtirish narhi
    """,
          codeApply: "tel://*111*1*17*1*1#",
          codeDeny: "tel://*111*1*17*1*2#"),
      Service(
          titleUz: "Tezkor o‘tkazmalar",
          titleRu: "Быстрый перевод	",
          descrRu: """
   Услуга «Быстрый перевод» для перевода средств на счет другого абонента «УзМобайл»

160 сум
За каждый успешный перевод.Как сделать перевод посредством USSD:
Для перевода средств на счет другого абонента «УзМобайл», абоненту осуществляющему перевод необходимо отправить USSD-команду: <номер_сервиса><сумма><номер_получателя>. Например, для перевода абоненту с номером 99ХХХАBCD средства равные 3000 сум, отправителю необходимо сделать USSD-запрос: *124*3*99XXXABCD#.	
    """,
          descrUz: """
          “Tezkor o‘tkazmalar” xizmati Uzmobile abonentlari o‘rtasida pul o‘tkazmalarini amalga oshirishga yordam beradi

160 so‘m
Muvafaqqiyatli pul o‘tkazmasi uchun xizmat narxi USSD orqali pul o‘tkazmalarini amalga oshirish:
Mablag‘larni UZMOBILE boshqa abonentiga o‘tkazish uchun, pul o‘tkazayotgan abonent quyidagi USSD so‘rovni amalga oshirishi kerak: Misol uchun, 99XXXABCD raqamli abonentga 3000 so‘mga teng mablag‘ yuborish uchun, yuboruvchi abonent quyidagi USSD so‘rovni yuboradi *124*3*99XXXABCD#..	
""",         codeApply: "tel://*124#",
         ),
      Service(
          titleUz: "Tungi qo’ng’iroqlar",
          titleRu: "Ночные звонки",
          descrRu: """
    Звонки внутри сети (GSM / CDMA), а также исходящие звонки на фиксированные номера линии «Узбектелеком» и его филиалов не тарифицируются (в период действия услуги)

420 сум
Стоимость активации услуги  
42 сум
Абонентская плата в день
      """,
          descrUz: """
       Xizmatni faollashtirishdan keyin, tarmoq (GSM/CDMA) ichida qo‘ng‘iroqlar, shuningdek, «O‘zbektelekom» va uning filiallari liniyalarida qayd etilgan raqamlarga chiquvchi qo‘ng‘iroqlar (xizmat amal qilish davrida) narxlanmaydi.

420 so‘m
Xizmatni faollashtirish narhi  
42 so‘m
Xizmat abonent to‘lovi, kuniga
        """,
          codeApply: "tel://*111*1*16*1#",
         
          codeDeny: "tel://*111*1*16*2#",
          codeSet: "tel://*111*1*16*3#"),
      Service(
        titleUz: "«Qabul qilinmagan qo‘ng‘iroq» va «Tarmoqda»",
        titleRu: "«Пропущенный звонок» и «В сети»",
        descrRu: """
        После активации услуги, абоненты могут получать уведомления на свой телефон о пропущенных звонках, когда телефон был выключен или находился вне зоны действия сети. Звонящему абоненту также доставляется SMS-уведомление о том, что вызываемый абонент в сети.40 сум
Абонентская плата в день
     """,
        descrUz: """
Endi UZMOBILE GSM abonentlari “Qabul qilinmagan qo‘ng‘iroq” xizmati orqali telefoni o‘chiq bo‘lganda yoki tarmoqdan tashqari bo‘lgan hollarda qabul qilinmagan qo‘ng‘iroqlar haqida ma’lumotga ega bo‘lishlari mumkin.
40 so‘m
Xizmat abonent to‘lovi, kuniga
      """,
        codeApply: "tel://*111*2*4*1#",
        codeDeny: "tel://*111*2*4*2#",
      ),
      Service(
        titleUz: "Chaqiriqni kutish va ushlabturish",
        titleRu: "Ожидание и удержание вызова",
        descrRu: """
   Режим ожидания вызова позволяет в процессе разговора с другим абонентом ответить на входящий звонок (либо позвонить другому абоненту) и удержать поступивший вызов до завершения текущего разговора, то есть поочерёдно разговаривать с двумя абонентами.
     """,
        descrUz: """
Suhbat mobaynida javob berish jarayonida boshqa abonent kirish qo‘ng‘iroqlari (yoki qo‘ng‘iroq qilgan boshqaabonent) Chaqiriqni kutish rejimi imkonini beradi va kirish chaqiriqlarini mazkur joriy suhbat tugagunigaqada rushlabturadi, ya’ninavbatma-navba tikki abonеnt bilan suhbatlashadi.
    """,
        codeApply: "tel://*43#",
        codeDeny: "tel://*43#",
      ),Service(
        titleUz: "Chaqiriqni boshqa manzilga yo‘llash",
        titleRu: "Переадресация вызова",
        descrRu: """
    Позволяет поступающие на Ваш мобильный телефон вызовы переводить на любой указанный Вами городской (можно на междугородный и международный номер через соответствующий код) или мобильный номер.
     """,
        descrUz: """
Mobil telefoningizga kiruvchichaqiriqlar siz ko‘rsatgan shahar (shaharlararo va Xalqaro raqamlarga shunga muvofiq orqali kod orqali o‘tkazilishi mumkin) yoki mobil raqamiga o‘tkazish Imkonini beradi.
 """,
        codeApply: "tel://**21*99899999999#",
        codeDeny: "tel://##21#",
        codeSet: "tel://*#21#",
      ),
    ]);
  }

  @override
  void dispose() {
    _services.close();
  }
}
