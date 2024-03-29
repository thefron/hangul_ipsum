# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

text_sources = TextSource.create([
  {
    title: '청춘예찬',
    content: '청춘 이는 듣기만 하여도 가슴이 설레는 말이다. 청춘! 너의 두손을 가슴에 대고, 물방아 같은 심장의 고동을 들어 보라. 청춘의 피는 끓는다. 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다. 이것이다. 인류의 역사를 꾸며 내려온 동력은 바로 이것이다. 이성은 투명하되 얼음과 같으며, 지혜는 날카로우나 갑 속에 든 칼이다. 청춘의 끓는 피가 아니더면, 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다. 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다. 풀밭에 속잎나고, 가지에 싹이 트고, 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며, 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다. 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다. 청춘의 피가 뜨거운지라, 인간의 동산에는 사랑의 풀이 돋고, 이상의 꽃이 피고, 희망의 놀이 뜨고, 열락의 새가 운다. 사랑의 풀이 없으면 인간은 사막이다. 오아이스도 없는 사막이다. 보이는 끝까지 찾아다녀도, 목숨이 있는 때까지 방황하여도, 보이는 것은 거친 모래뿐일 것이다. 이상의 꽃이 없으면, 쓸쓸한 인간에 남는 것은 영락과 부패뿐이다. 낙원을 장식하는 천자만홍이 어디 있으며, 인생을 풍부하게 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다. 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다. 석가는 무엇을 위하여 설산에서 고행을 하였으며, 예수는 무엇을 위하여 광야에서 방황하였으며, 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서. 옷을 위하여서, 미인을 구하기 위하여서 그리하였는가? 아니다. 그들은 커다란 이상, 곧 만천하의 대중을 품에 안고, 그들에게 밝은 길을 찾아 주며, 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다. 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며, 그들의 그림자는 천고에 사라지지 않는 것이다. 이것은 현저하게 일월과 같은 예가 되려니와, 그와 같지 못하다 할지라도 창공에 반짝이는 뭇 별과 같이, 산야에 피어나는 군영과 같이, 이상은 실로 인간의 부패를 방지하는 소금이라 할지니, 인생에 가치를 주는 원질이 되는 것이다. 그들은 앞이 긴지라 착목한는 곳이 원대하고, 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다. 그러므로 그들은 이상의 보배를 능히 품으며, 그들의 이상은 아름답고 소담스러운 열매를 맺어, 우리 인생을 풍부하게 하는 것이다.보라, 청춘을 ! 그들의 몸이 얼마나 튼튼하며, 그들의 피부가 얼마나 생생하며, 그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에, 우리의 귀는 생의 찬미를 듣는다. 그것은 웅대한 관현악이며, 미묘한 교향악이다. 뼈 끝에 스며들어 가는 열락의 소리다.이것은 피어나기 전인 유소년에게서 구하지 못할 바이며, 시들어 가는 노년에게서 구하지 못할 바이며, 오직 우리 청춘에서만 구할 수 있는 것이다. 청춘은 인생의 황금시대다. 우리는 이 황금시대의 가치를 충분히 발휘하기 위하여, 이 황금시대를 영원히 붙잡아 두기 위하여, 힘차게 노래하며 힘차게 약동하다.'
  }, {
    title: '별 헤는 밤',
    content: '계절이 지나가는 하늘에는 가을로 가득 차 있습니다. 나는 아무 걱정도 없이 가을 속의 별들을 다 헤일 듯합니다. 가슴속에 하나 둘 새겨지는 별을 이제 다 못 헤는 것은 쉬이 아침이 오는 까닭이요, 내일 밤이 남은 까닭이요, 아직 나의 청춘이 다하지 않은 까닭입니다. 별 하나에 추억과 별 하나의 사랑과 별 하나에 쓸쓸함과 별 하나에 동경과 별 하나에 시와 별 하나에 어머니, 어머니, 어머님, 나는 별 하나에 아름다운 말 한 마디씩 불러 봅니다. 소학교 때 책상을 같이 했던 아이들의 이름과, 패, 경, 옥 이런 이국 소녀들의 이름과 벌써 애기 어머니 된 계집애들의 이름과, 가난한 이웃 사람들의 이름과, 비둘기, 강아지, 토끼, 노새, 노루, 프랑시스 잠, 라이너 마리아 릴케 이런 시인의 이름을 불러 봅니다. 이네들은 너무나 멀리 있습니다. 별이 아스라히 멀듯이, 어머님, 그리고 당신은 멀리 북간도에 계십니다. 나는 무엇인지 그리워 이 많은 별빛이 내린 언덕 위에 내 이름자를 써 보고, 흙으로 덮어 버리었습니다. 딴은 밤을 새워 우는 벌레는 부끄러운 이름을 슬퍼하는 까닭입니다. 그러나 겨울이 지나고 나의 별에도 봄이 오면 무덤 위에 파란 잔디가 피어나듯이 내 이름자 묻힌 언덕 위에도 자랑처럼 풀이 무성할 거외다.'
  }
])
