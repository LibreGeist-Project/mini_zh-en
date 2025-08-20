#import "@preview/catppuccin:1.0.0": catppuccin, flavors
#import "@preview/showybox:2.0.4": showybox

// #show: catppuccin.with(flavors.mocha)

#set document(
  author: ("S.C.Gruget", "HydroDing", "Naro-Xeno"),
  date: auto,
  title: [Mini: The Minimal Language | 极简语言],
)

#let enable_en = false;
#let enable_zh = true;
#let split = [#v(0.8em) *#h(0.30fr) \*#h(0.06fr) \* #h(0.06fr)\* #h(0.30fr)* #v(0.3em)];

#set text(
  lang: { if enable_zh { "zh" } else { "en" } },
  region: { if enable_zh { "cn" } else { none } },
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "WenYuan Serif SC",
  ),
  hyphenate: true,
  ligatures: true,
)

#set par(justify: true)

#show smartquote: set text(font: "Liberation Serif")

#set quote(block: true)

#show heading: it => {
  set text(
    font: (
      (name: "Libertinus Serif", covers: "latin-in-cjk"),
      "WenYuan Serif SC",
    ),
  )
  set par(first-line-indent: 0em) // 取消标题首行缩进
  it.body
  v(0.2em) // 增加标题后的垂直间距
}

#show strong: set text(
  font: (
    (name: "Libertinus Serif", covers: "latin-in-cjk"),
    "Noto Serif CJK SC",
  ),
  weight: "light",
)

#show heading.where(depth: 1): it => {
  pagebreak()
  set align(center + horizon)
  it
}

#let en(body) = {
  show quote: set text(font: "EB Garamond")
  set text(14pt)
  set par(first-line-indent: 1em)
  if enable_en {
    body
  } else { none }
}

#let zh(body) = {
  set underline(offset: 0.2em)
  set text(
    13pt,
    tracking: 0.3pt,
    font: (
      (name: "Libertinus Serif", covers: "latin-in-cjk"),
      "FZShuSong-Z01S",
    ),
  )

  set par(
    first-line-indent: (amount: 2em, all: true),
    spacing: 1em,
    leading: 1em,
  )

  show quote: set text(font: "Zhuque Fangsong (technical preview)")
  show emph: set text(
    font: (
      (name: "Liberation Serif", covers: "latin-in-cjk"),
      "LXGW WenKai",
    ),
    region: "CN",
  )
  show regex("\d+"): set text(12.5pt, font: "FZShuSong-Z01S")
  show regex("——"): it => { text(font: "WenYuan Rounded SC M")[#it] }

  if enable_zh {
    body
  } else { none }
}

#let example(body) = {
  show table.cell: it => {
    set text(font: (
      (name: "EB Garamond", covers: "latin-in-cjk"),
      "LXGW WenKai",
    ))
    emph(it)
  }
  set table(
    columns: 2,
    stroke: none,
    align: (center + bottom, left),
  )
  showybox(
    frame: (body-color: gray.lighten(85%), border-color: gray.lighten(85%)),
    shadow: (
      offset: 0pt,
    ),
  )[
    #body
  ]
}

// 封面 | Titlepage
#page(
  margin: (
    top: 7cm,
    bottom: 4cm,
    left: 2cm,
  ),
)[
  #align(horizon + center)[
    #text(100pt, font: "FreeSerif", gray.darken(80%))[*Mini*] \ \ \
    #if enable_zh {
      text(30pt, font: "WenYuan Rounded SC M", gray.darken(80%))[: ~极简语言]
    } else {
      text(
        30pt,
        font: "WenYuan Rounded SC M",
        gray.darken(80%),
      )[~: The Minimal Language]
    }
  ]
  #align(bottom + center)[
    #text(size: 30pt)[S.C.Gruget]

    #if enable_zh {
      text(size: 20pt)[译：HydroDing 2021.11.10]
      [ #v(0em) ]
      text(size: 15pt)[排版/译文润色：Naro-Xeno]
    } else {
      text(size: 15pt)[Typesitting: Naro-Xeno]
    }
  ]
]

#show outline: set par(first-line-indent: 0em)
#{
  set text(14pt, font: (
    (name: "EB Garamond", covers: "latin-in-cjk"),
    "WenYuan Sans SC M",
  ))
  if enable_zh {
    outline(title: "目录")
  } else { outline() }
}
#pagebreak()

#set page(numbering: "1")
#counter(page).update(1)

#en[Mini is an attempt to create the simplest naturalistic language for human communication.]

#zh[Mini语是一种旨在为人类交流创造最简单的自然主义语言的尝试。]

#en[With simple phonetics, inflectionless grammar, and a global vocabulary of exactly 1,000 words, Mini is ideal for use as an #underline[international auxiliary language.]]

#zh[Mini语的语音简单，语法无屈折，只有 1000 个单词的全球词汇，是作为#underline[国际辅助语言]的理想选择。]

#en[Features of Mini:]
#en[
  - *Subject-Verb-Object*
  - *Purely analytic grammar*
  - *Part-of-speech invariance:* Mini uses three particles to mark the part of speech. This allows most words to be used any part of speech.
  - *Only 19 phonemes:* Five vowels /a e i o u/ and fourteen consonants /b d f g k l m n p r s t v/ and j /dʒ/
  - *Simple phonotactics:* Each syllable has a simple consonant-vowel structure (C?Vn?), similar to many Austronesian languages.
  - *Only 1,000 words:* The goal of Mini is to have as limited a vocabulary as possible while still being sufficient for most spoken conversations, news articles, blog posts, short stories, etc. — everything except technical jargon.
  - *Powerful word-compounding system*
  - *International breadth & depth:* Mini strives to balance international recognizability with language breadth. A majority of words are sourced from English and the Romance languages, but many other source languages are included, from Arabic to Zulu.
]

#zh[Mini语的特征：]
#zh[
  - *主语-动词-宾语（SVO）结构*
  - *纯粹的分析型语法*
  - *无词性屈折：*Mini 使用三个基本粒子来标记词性。这使得大多数单词可以用作任何词性。
  - *只有19个音素：*5 个元音 /a e i o u/ 和 14 个辅音 /b d f g k l m n p r s t v/ 和 j /dʒ/
  - *简单的音节结构：*每个音节都有一个简单的辅音元音结构(C?Vn?)，类似许多南岛语。
  - *只有 1000 个单词：*Mini 的目标是拥有尽可能有限的词汇量，同时仍然满足大多数口语谈话、新闻报道、博客文章、短篇故事等。——涵盖除了技术术语的一切。
  - *强大的词复合系统*
  - *国际广度与深度*：Mini 致力于平衡国际的可识别性和语言的广度。大多数单词来源于英语和罗曼语言，但包括许多从阿拉伯语到祖鲁语的其他源语言。
]

#en[= I. Introduction]

#zh[= 一、引言]

#en(
  quote(
    [
      _He knows that there are in the soul tints more bewildering, more numberless, and more nameless than the colours of an autumn forest… Yet he seriously believes that these things can every one of them, in all their tones and semitones, in all their blends and unions, be accurately represented by an arbitrary system of grunts and squeals. He believes that an ordinary civilized stockbroker can really produce out of this own inside noises which denote all the mysteries of memory and all the agonies of desire._
    ],
    attribution: [G.K. Chesteron , as quoted in Borges' _The Analytical Machine of John Wilkins_],
  ),
)

#zh(
  quote(
    [
      他深知灵魂的色彩比秋林之色更为纷繁、更为无数、更不可名状；他深知世间存在着从未被谴责的罪恶和从未被命名的美德，它们四处游荡，行着奇异而可怖的役使。然而他却深信不疑：所有这一切，连同它们所有的色调与半音、所有的交融与混合，都能被一套任意的咕哝与尖叫声系统（即语言）精确地再现出来。他相信一个普普通通的文明世界的股票经纪人，真能从他肚子里鼓捣出一些声响，用以指代记忆的全部奥秘和欲望的一切煎熬。
    ],
    attribution: [G.K. 切斯特顿，引用自博尔赫斯的《约翰·威尔金斯的分析机器》],
  ),
)

#en[It is a truth universally acknowledged that a man in possession of an unhealthy interest in languages and too much time on his hands must be in want of a language of his own creation.]

#zh[凡是对语言有嗜好，又恰有闲工夫的人，必定会想要自创语言——这已经成了一条举世公认的真理。]

#en[There have certainly been many attempts. In 1688, John Wilkins published an Essay Towards a Real Character and a Philosophical Language, in which he describes a new universal language shorn of the vagaries and ambiguities of natural language. In place of Latin or a spoken language like English, Wilkins desired a new lingua franca for scholars, travelers, and businessmen composed solely of the most basic elements of thought. Wilkins devised a taxonomy of 40 general categories for his language. Vocabulary would be constructed by subdividing those basic categories into "differences" and "pecies."]

#zh[此类尝试当然并不罕见。1688年，约翰·威尔金斯（John Wilkins）便曾发表《论真实符号与哲学语言》（_Essay Towards a Real Character and a Philosophical Language_）一文，文中阐述了一门剔除了自然语言中歧义与奇怪变化的新通用语言。为了替代拉丁语或者类似英语的口语，威尔金斯为学者、旅行者和商人设想了一种完全由最基本的思想元素组成的新通用语。为此，他设计了一个含40个基本范畴的分类体系，并将这些基本类别按“差异（difference）”和“种（species）”继续细分来构建词汇。]

#en[For instance, the word for fire, Deb, is the "first difference" formed from the category of elements, De. And the word for flame, Debαt, is the "first species" of fire. Wilkins believed every object in the world could be described unambiguously and uniquely with this approach. The discovery of a new animal or feature of the physical world would thus mean a new word — and vice versa.]

#zh[例如，表“火”的单词_Deb_是从元素范畴_De_派生出的“第一级*差异*”，而表“火焰”的单词_Debαt_，则是火的“第一*种*”。威尔金斯相信，通过这种方法，世间万物皆可获得明确且唯一的描述。由此，一种新动物或物质世界新特征的发现，必将催生新词——反之亦然。]

#en[Wilkins never completed his language. His published manuscript was merely a proof of concept — but even then there were problems. For starters, Wilkins’ approach to word derivation made it difficult to tell words apart: words derived from a common root would sound too similar to each other and be too difficult to differentiate. Wilkins himself was known to make errors, mistaking _Gade_ (barley) for _Gape_ (tulip). ]// here is a link, fix soon

#zh[威尔金斯没有完成他的语言。他出版的手稿只是一个概念验证——但即使在那时也有问题。首先，威尔金斯的单词推导方法使得单词很难区分：同根词的读音过于相似，难以区分。威尔金斯本人也会犯错误，将_Gade_（大麦）误认为_Gape_（郁金香）。]

#en[The more damning problem for Wilkins’ approach is philosophical: there simply is no one obvious taxonomy for all objects and concepts. It is certainly true that one can create a language that derives all of its vocabulary from a few basic concepts. But what makes certain concepts basic rather than others? And what about derived words? What are the rules for deriving new words from basic concepts? Are those rules for derivation simple algorithmic procedures or complex divinations that require human discretion? And if those word derivations cannot be performed algorithmically — and in Wilkin’s case, they were not — then is there not a degree of arbitrariness and convention in the word choices themselves? These were questions Wilkins could not answer.]

#zh[对于威尔金斯的方法，其更致命的问题是哲学上的：对于所有的对象和概念来说，根本不存在一个明显的分类法。诚然可以创造一种语言，使其所有词汇均从一些基本概念中产生，然而，是什么使某些概念成为基本概念，而非其他概念呢？派生词如何处理？从基本概念推导新单词的规则是什么？这些推导规则是简单的算法程序还是需要人类斟酌的复杂揣测？倘其推导过程无法算法化——在威尔尼斯那里，它们不能——则词汇遴选本身就不具备一定程度的任意性和习惯吗？威尔金斯无法回答这些问题。]

#en[But the dream of constructing a newer, simpler, more rational language lived on. Over the course of subsequent centuries, linguists, hobbyists, and mad utopians have dreamed up more languages than mankind has collectively spoken. In 1827, a French linguist created Solresol, a language based on musical notes. In the 20th century, a group of hobbyists created Lojban, a language modeled after predicate calculus with perfectly regular grammar (and a Yacc parser to prove it!). (Lojban itself is descendent of an earlier logical language called Loglan.)]

#zh[但构建一种更新、更简单、更理性的语言的梦想依然存在着。其后数世纪，语言学家、爱好者与狂热的乌托邦分子构想出的语言，竟超出了人类所说语言的总和。1827 年，一位法国语言学家创造了一种基于音符的语言——索来索语（Solresol）。在 20 世纪，一群爱好者创造了逻辑语（Lojban），这是一种模仿谓词演算的语言，具有完全规则的语法(还有一个 Yacc 解析器来证明它！)。(Lojban 本身是一种早期的 Loglan 逻辑语言的后裔。)]

#en[The most famous constructed language, of course, is Esperanto. Esperanto was born out of Polish linguist L.L. Zamenhof’s dream of international unity and human solidarity: He created the language to serve as a culturally neutral universal second language, which he believed would foster peace. (Esperanto’s utopian ideals were not without detractors. One particularly acerbic critic devotes several paragraphs to excoriating Esperantists in his best-selling political manifesto.)]

#zh[最著名的人造语言当然是世界语（Esperanto）。波兰语言学家柴门霍夫（L.L. Zamenhof）怀揣国际团结和人类团结的梦想创造了这门语言：为了其作为一种文化中立的通用第二语言，以促进和平。(世界语的乌托邦式理想并非没有批评者。一位特别尖刻的评论家在他最畅销的政治宣言中用了好几段话来痛斥世界语者。)]

#en[In contrast to Solresol and Lojban, Esperanto is an a posteriori language — a language derived from other natural languages, rather than created de novo. This has been the key to its (rather modest) success. Esperanto is essentially a streamlined and grammatically consistent version of a Western European language (with a few Slavisms thrown in for good measure). An educated reader of English can get the gist of most sentences without any prior study.]

#zh[与索来索语和逻辑语相比，世界语是一种后验语言——一种源自其他自然语言的语言，而非从头创造出来的。这正是其（相对有限的）成功的关键。世界语本质上是西欧语言的一个精简型和语法一致的版本（其中还加入了一些斯拉夫语）。对于一个受过教育的英语读者来说，不经任何事先研究就能理解其大多数句子的要点。]

#en[And yet, despite Esperanto’s relative ease of learning, the language did not catch on. If there is a universal second language in the world today, it’s English, not Esperanto. The demands of learning a new language from study — even a very simple one — are simply too great.]

#zh[然而，尽管世界语相对容易学习，这种语言并没有流行起来。如果说今天的世界上有一门通用的第二语言，那就是英语，而不是世界语。通过努力学习一门新语言的要求实在是太高了——即使它非常简单。]

#en[Given the great variety of constructed languages over the last few centuries and their limited success in adoption, it would seem quixotic in the extreme to try to develop a new one..\.]

#zh[鉴于过去几个世纪构造语言的巨大多样性及其有限的应用成功，尝试开发一门新的语言显得极其不切实际...]

#split

#en[My own linguistic slumber was roused after learning about Toki Pona. Toki Pona (TP) is a brilliant micro-language of 120–125 words created by linguist Sonja Lang. Unlike Wilkins’ Real Characteristic or Lojban, TP was not made to be a more logical and precise language — rather the opposite. Lang originally created TP as a way of coping with depression and intended for it to be simple and cute. This it certainly achieves.]

#zh[在得知道本语（Toki Pona）后，我个人的语言学兴趣被重新唤醒了。道本语是由语言学家索尼娅·朗（Sonja Lang）创造的一门出色的微型语言，仅包含120-125个单词。与_威尔金斯的真实符号_或逻辑语不同，道本语的目标并非成为一门更具逻辑性和精确性的语言——恰恰相反。Lang最初创建道本语是为了应对抑郁症，并打算让它简单而可爱（cute）。它无疑实现了这一点。]

#en[TP’s simplicity and cuteness is a result of its simple phonology and simple vocabulary limited to “cute” words like mu (moo) or mama (parent). The grammatical premise of TP is no less cute: it employs strict Subject-Verb-Object word order and uses a single particle word, li, to separate the subject from the predicate and another, e, to introduce the direct object. This allows the words of TP to serve as many different parts of speech depending on their position in a sentence and ensures that TP’s small vocabulary is put to good use.]

#zh[道本语的简单和可爱源于其简单的音位系统及仅包含如"mu"（哞）或"mama"（父母）这类“可爱”词汇的简单词库。道本语的语法前提同样可爱：它采用严格的 主-谓-宾 语序，使用一个单一粒子词"li"来分隔主语和谓语，用另一个粒子词"e"来引入直接宾语。这使得道本语的词语依据其在句中的位置可以充当多种不同的词类，并确保道本语有限的词汇量得到充分利用。]

#en(example[
  jan pona mi li moku e kili lili.

  _My friend (good person) eats the small fruit._
])

#zh(example[
  jan pona mi li moku e kili lili.

  _我的朋友（好人）吃小水果。_
])

#zh[但这种技术并非没有缺点。道本语作为一门语言，其最大的问题或许在于其猖獗的歧义性。在只有125个单词的语言中，语义模糊是意料之中的，但实际上的主要困扰源于语法。由于没有明确的系动词，因此很难判断一个句子是否包含动词。此外，由于TP介词可以充当多种词类，并且可以不与谓语分隔符一起使用，解析某些句子可能非常困难。]

#zh(example[
soweli li moku.

_动物吃。_或者 _动物是食物。_

mi wile e tomo tawa sina.

_我想要你的车（移动的建筑）。_或者 _我为你想要一所房子（建筑）。_
])

#zh[除了语法歧义外，道本语还有其他几个问题：

+ 它并不是一种真正的递归语言：它没有从句，因此使得某些句子难以表达（例如，“我宁愿去游泳”很难翻译）。
+ 词汇选择存在不足——至少在试图在日常生活中交流的视角下是如此。（但从该语言声称的“极度可爱”目标看，它是完美的：在它的百来个词汇中，相当大一部分用于描述动物：有鸟、鱼、可爱动物、非可爱动物、动物叫声拟声词等的专门词。）
+ 语言简朴的音位系统使得词根难以辨认。眯眼细看，“toki”有点像英语的“talk（说）”，“pona”有点像拉丁语的“bona（好）”，但这很牵强。其他词则更难辨认。
]

#zh[歧义性对于人造语言尤其不利，因为它们缺乏自然语言所拥有的历史规范和社区标准。对于其词语用法，如果没有共享的社会预警，明确的规则就变得更重要。]

#zh[所有这些问题的后果是，用道本语交流任何哪怕是稍微复杂点的东西都非常困难。如果你去浏览道本语的论坛和聊天室，你经常会看到流利的道本语者不得不把他们相对基本的帖子翻译成英语，因为没有人能理解他们想说什么。]

#split

#zh[让我创造Mini语的火花源于这样一个洞见——像道本语这样的微语言实际上是可以应用的：原则上没有理由规定一个词汇量有限的语言不能兼具简单、完整、明确的语法以及基于可理解的词根设计的，足以处理日常交流的大部分方面的词汇。]

#zh[Mini语通过简化和消除语法歧义解决了道本语的诸多问题。Mini语与道本语的第一个重大区别是用指示词类的粒子词取代了单一的谓词标记（predicate marker）"li"和直接宾语标记"e"。]

#zh[Mini没有使用"li"同时充当系动词（copula）和引入动词的标记，而是使用3个不同的粒子词：引入动词用i，名词用a，形容词用e。后两者（a和e）也作为系动词，能够更精确地指明谓语是名词性的（nominal）还是形容词性的（adjectival）。]

#zh[这种变化有助于大量减少歧义，而只需要一个额外的粒子。]

#zh(example(table(
align: (left, left),
[Animale i manja.], [动物吃。],
[Animale a manja.], [动物是食物。],
[Animale e manja.], [动物是食物性的（即可食用）。],
[Animale i manja a veji. ], [动物吃植物。]
)))

#zh[与像英语这样只有一个主要的系词（动词“to be”）的语言相比，
有两个不同的粒子用于谓语似乎具有不必要的学术性。但根据先前迭代的语言版本的我的使用经验，我可以向你保证，事实并非如此！]

#zh[#pagebreak() 考虑一下这两个 Mini 句子：]

#zh(example(table(
align: (left, left),
[Da e duro.], [这很困难。],
[Da a duro.], [这是个问题。]
)))

#zh[
它们之间有天壤之别！如果你对正与困难作斗争的人说第一句，他们可能将其解读为一种共情的表态：“我明白你正在处理的事情很困难，我深有同感，但请继续。”而在实际交谈中说后一句将表明对方所做之事效率低下，需要改变。]

//
//

#en[= II. Phonology & Orthography]

#zh[= 二、音系和正字法]

#en[Mini has 19 letters,]

#zh[Mini语有 19 个字母，]


#align(center)[#text(
    15pt,
  )[*a ~b ~d ~e ~f ~g ~i ~j ~k ~l ~m ~n ~o ~p ~r ~s ~t ~u ~v*]]

#en[Each letter matches its International Phonetic Alphabet pronunciation with the exception of J, which is the English /dʒ/.]

#zh[每个字母都与国际音标（IPA）的发音一致，除了 J，读作英语的/dʒ/。]

#en[Words are 1–4 syllables, with each syllable sharing the same structure: optional consonant, vowel, optional “n”, or C?Vn?. There are no consonant clusters or diphthongs.]

#zh[单词有1-4个音节，每个音节有着相同的结构：可选的辅音、元音、可选的"n"，或表示为C?Vn?。没有辅音簇或双元音。]

#en[If a syllable ending in the letter N is followed by a P or a B, the letter is written instead as an M: \ #align(center)[tenpo $=>$ tempo; menba $=>$ memba]]

#zh[如果以字母n结尾的音节后面跟着p或b，这个字母被写成m：\ #align(center)[tenpo#h(0.2em)$=>$#h(0.2em)tempo；menba#h(0.2em)$=>$#h(0.2em)memba]]

#en[Stress falls on the penultimate syllable. One-syllable words are usually stressed, unless they are being used as prepositions, conjunctions, or particles.]

#zh[重音落在倒数第二个音节上。单音节词通常有重音，除非它们被用作介词、连词或粒子。]

#en[The ideal Mini accent would sound something like Latin American Spanish or Bahasa Indonesia.]

#zh[理想的Mini语口音听起来像拉丁美洲西班牙语或者印度尼西亚语。]

#en[Mini can be written in all lowercase, but given the ubiquity of modern word processors and the patterns they impose, we use the same orthographic conventions as English: uppercase for proper nouns and the beginnings of sentences, lowercase elsewhere.]

#zh[Mini语可以全部使用小写字母拼写，但考虑到现代文字处理程序的普遍性和它们所施加的模式，我们使用与英语相同的正字法惯例：专有名词和句子开头的第一个字母大写，其他地方小写。]

#en[= III. Vocabulary]

#zh[= 三、词汇]

#en[Mini has a vocabulary of exactly 1,000 words.]

#zh[Mini 正好有 1000 个单词。]

#en[The goal of Mini is to have as limited a vocabulary as possible while still being sufficient for most spoken conversations, news articles, blog posts, short stories, etc.—everything except technical jargon.]

#zh[Mini 的目标是拥有尽可能有限的词汇量，同时仍然满足大多数口语谈话、新闻报道、博客文章、短篇故事等场景。——涵盖除了技术术语的一切。]

#en[Each word is intended to be as recognizable as possible from its respective source language, have a meaning that is maximally disjoint from the others, and be as useful as possible in forming compound words.]

#zh[每个单词源自其对应语言时需具有高辨识度，词义与其他词最大程度互斥，并在形成复合单词时尽可能有用。]

#en[The vocabulary was selected in part by consulting word frequency lists in several languages and opportunistically merging similar words.]

#zh[词汇是部分通过调查几种语言的单词频率列表而选择的，并取巧地合并了类似的单词。]

#en[A significant portion — perhaps a third — of Mini’s vocabulary is derived from Glosa, a conlang created in the 70’s. Given Mini’s phonetic constraints, there aren’t many direct borrowings, but there are a lot of semantic equivalents.]

#zh[Mini语的词汇中有很大一部分（也许有三分之一）是来自于70年代的人造语言格罗莎语（Glosa）。考虑到Mini语的语音限制，没有多少是直接借词，但存在大量语义等价词。]

#zh[少量词汇源自其他人造语言：世界语、泛世界语（Pandunia）和格洛巴萨语（Globasa）。但大多数都是直接来自自然语言的。]

#zh[我选取词汇的“算法”：

  + 如果有一个明显国际知名的词，选择它： banana, guru, tobako

  + 如果在英语或罗曼语言中有一个常见的非西方外来词，选择它：tabu，tipi，geko

  + 如果有一个易于辨认的罗曼语言或日耳曼语言的术语，使用它：agila, bebe, fide

  + 否则，从世界上所有主要语言中选择最合适的单词，优先使用大量尚未使用的语言：igi（约鲁巴语）、jin（普通话）、puko（芬兰语）
]

#zh[另外，每个单词必须：
  + 满足 Mini 的语音限制（C?Vn?）且不超过 4 个音节。
  + 尽可能匹配一种源语言的发音或正字法（或理想情况下，两者都匹配）（而不是“混合”不同来源的单词）。
  + 避免使用听起来太相似的单词，特别是当它们在类似的上下文中使用时。
]

#zh[
  此方案产生了一系列词汇，它们既具有国际辨识度，也具有语言多样性：涵盖了拉科塔语（Lakota）、匈牙利语（Hungarian）一直到祖鲁语（Zulu）。
]

#zh[值得注意的是，粒子_i_——Mini语语法的一个核心特征——实际上是从 Tok Pisin 直接引入的。]

#split

#zh[在真正的后现代时尚中，Mini 的词汇量在阳春白雪和下里巴人之间飘摇。一方面，它有来自拉丁语、希腊语和梵语的借词（例如_fusi 融合_；_lipo 油脂_；_duka 遭受_）。另一方面，还有俗语，比如_tivi 电视_；_pipi 小便_；_dogi 狗_。]
#v(0.5em)
#zh[一些随机按主题排列的词汇：]

#zh(align(left)[
  #columns(2)[
    - 颜色: bulu, ruja, midori, pila
    - 动物: gato, dogi, kavalo, muso
    - 食物: keju, keki, vino, patata
    - 家具: kabinete, sofa, kama
    - 情感: joli, melankoli, furi, fobo
    - 技术: komputa, radio, fon
    - 服装: roba, jaketa, sapato, topi
    #colbreak()
    - 抽象: idea, neso, loji, siensa
    - 身体: neka, pedi, lunge, rena
    - 时间: ora, minute, soma, ano
    - 方向: direto, levi, nore, vese
    - 人物: bebe, kinde, raja, polisa
    - 地方: kasa, siti, patio, kampo
  ]
])

#split

#zh[Mini语的词汇分为两部分：*Mini Kore*，核心的 120 个单词列表（形成了一个完整的语言）和*Mini Mundo*，一个880个单词的补充词汇表。]

#zh(link(
  "https://minilanguage.medium.com/mini-mundo-glossary-6da0025d7f21",
)[完整词汇表（需科学上网）])

#en[= IV. Grammar]

#zh[= 四、语法]

#en[== Basic Sentence Structure]

#zh[== 基本句子结构]

#en[Mini words can serve as many different parts of speech depending on their position in a sentence. Mini uses a few different particle words to help determine what part of speech a word is.]

#zh[Mini语的单词可依据其在句中的位置充当不同的词性，其词性由几个不同的粒子来帮助确定。]

#en[The particle _i_ introduces the verb; _a_ introduces the direct object. These two particles give rise to Mini’s basic sentence structure:]

#en[
  [subject] i [verb] a [object]

  Tu i manja.              _You eat._

  Man i bibe a vasa.       _Someone drinks water._

  Bobi i vasa a veji.      _Bob waters the plants._
]

#zh[粒子 _i_ 引入动词；_a_ 引入直接宾语。这两个粒子产生了Mini语的基本句子结构：]

#zh(
  example[
    [主语] i [动词] a [宾语]

    Tu i manja.

    _你吃。_

    Man i bibe a vasa.

    _人喝水。_

    Bobi i vasa a veji.

    _鲍勃给植物浇水。_
  ],
)

#en[== Predication]

#zh[== 谓语]

#zh[Mini语没有_to be_（是）这个系词。相反，粒子_a_被用作谓语性名词的系词（除标记直接宾语外）：]

#en(
  example[
    [subject] a [noun]

    Bob a man.       Bob is a person.

    Ise a vasa.      Ice is water.

    Veji a manja.    The vegetable is food.
  ],
)

#zh(example[
  [主语] a [名词]

  Bob a man.

  _鲍勃是人。_

  Ise a vasa.

  _冰是水。_

  Veji a manja.

  _蔬菜是食物。_
])

#en[Mini uses another copula, the particle e, for predicative adjectives.]

#zh[Mini语为谓语性形容词使用另一个系词：粒子_e_。]

#zh(example[
  [主语] e [形容词]

  Manja e kula.

  _食物很冷/食物是冷的。_

  Bob e vasa.

  _鲍勃湿了。_

  Manja e Bob.

  _食物是鲍勃的。_
])

#zh[我们现在已经介绍了 Mini 用来表示词性的 3 个粒子：]

#en[We have now introduced the 3 particle words that Mini uses to indicate parts of speech:]

#zh(example(table(
  [粒子],
  [引导],
  [_i_],
  [动词],
  [_a_],
  [直接宾语和名词性补语],
  [_e_],
  [形容词和副词性补语],
)))

#zh[== 名词短语词序]

#en[== Noun Phrase Word Order]

#zh[Mini语不使用屈折结构。单词的性、数、格、情态、时态等必须从语境中推断或者被明确地陈述。]

#en[Mini does not use inflection. The number, gender, case, mood, tense, etc. of words must be inferred from context or stated explicitly.]

#zh[Mini语中的形容词出现在名词前面，并采用严格的词序：]

#en[Adjectives in Mini come before the noun and employ a strict word-ordering:]

#zh(example[
  mega loke

  _大地方_

  no mui kolo

  _没有许多颜色_

  dika feo bebe

  _胖丑婴儿_

  \

  mui vasa kolo ropa

  $=$ $("mui" ("vasa" ("kolo ropa") )$

  $=$_（多的（湿的（彩色的 衣服））_

  $=$ _许多湿的彩色衣服_
])

#zh[粒子_o_可用于改变修饰语的结合方式，即短语内不同修饰语的分组方式。请注意，粒子_o_并非介词，也无对应的英语单词。]

#zh(example[
  mui vasa o kolo ropa

  $=$ $(("mui" "vasa") ("kolo ropa"))$

  $=$ _((非常 湿的) (彩色的 衣服))_

  $=$ _非常湿的 彩色的衣服_

  \

  mui vasa kolo o ropa

  $=$ $(("mui" ("vasa kolo")) "ropa")$

  $=$ _非常 水-颜色 衣服_

  $=$ _非常蓝色的衣服_
])

#zh[粒子_o_也可用于标记或强调某词用作修饰语：]

#zh(example[
  sama o kasa

  _相同的房子_

  sama kasa

  _像房子一样 (此处的sama用作介词)_
])

#zh[== 人称代词]

#zh[Mini语使用下列人称代词：]

#zh(example(table(
  columns: 6,
  [mi], [第一人称],
  [tu], [第二人称],
  [si], [第三人称],
)))

#zh[代词没有性或数的词形变化。如需表示复数或性别，必须附加特定词语如_ale_或_feme_。语法上，这些词被视为复合名词。]

#zh(example(columns(2)[#table(
    align: (left, left),
    [mi],
    [我],
    [mi-duo],
    [我俩],
    [mi-ale],
    [我们 (包括听者)],
    [mi-mui],
    [我们 (不包括听者)],
    [mi-ego],
    [我自己],

    [tu],
    [你],
    [tu-ale],
    [你们],
    [tu-ego],
    [你自己],
  )
  #colbreak()
  #table(
    align: (left, left),
    [si],
    [他 / 她 / 它],
    [si-viro],
    [他],
    [si-feme],
    [她],
    [si-kosa],
    [它],
    [si-ale],
    [他们],
    [si-uno],
    [某个 (不定代词)],
    [si-ego],
    [他自己 / 她自己 / 它自己],
    [si-ota],
    [另一个 / 其他的那个],
  )]))

#zh[当人称代词作修饰语时，它们变成所有格形式。]

#zh(example(table(
  [tu kaja],
  [_你的盒子_],

  [si note],
  [_他/她/它的笔记_],

  [mi-ale kosa],
  [_我们的东西_],

  [ale mi kosa],
  [_所有我的东西_],
)))

#zh[要强调或消除一个代词的属格用法的歧义，请使用粒子_o_：]

#zh(example(table(
  [si o feme],
  [_他/她/它的女人_],
)))

#zh[== 粒子脱落（Particle Dropping）]

#zh[Mini语允许在语义明确的情况下省略语法粒子。]

#zh[这在主语或宾语是单个代词或专有名词的短句中尤为常见。]

#zh(example[
  Mi i amo a tu. $=>$ Mi amo tu.

  _我爱你。_

  Si i mira a Bob. $=>$ Si mira Bob.

  _他/她看见鲍勃。_
])

#zh[== 介词]

#zh[介词短语通常直接后置于它们修饰的单词，但在无歧义的情况下，副词性介词短语可以后置于直接宾语。]

#zh[如果使用一个介词短语作为谓词，则必须使用粒子_e_。]

#zh(
  example({
    table(
      [de],
      [从、属于、关于、出于、由（from, of, about, by, out of, made of）],
      [en],
      [在（in, at, on）],
      [go],
      [到、向、去、为了（to, for, go）],
      [kon],
      [伴随着、凭借着（with）],
      [sama],
      [像、如同、相同（like, as, than, same）],
    )
    table(
      align: (left, left),
      [Bob e de Amerika.],
      [鲍勃来自美国。],
      [Alisa e en London.],
      [艾丽丝在伦敦。],
      [Da e go tu.],
      [那是给你的。],
      [Bob e kon Alisa.],
      [鲍勃和艾丽丝在一起。],
      [Mi e sama tu.],
      [我就像你。],
    )
      }),
)

#zh(example(table(
      align: (left, left),
[Mi i toma a kosa go tu.],
      [我把东西带给你。],
      [Alisa i viva en London.],
      [艾丽丝住在伦敦。],
      [Man en pan-botega i manja.],
      [在面包房的人在吃。],
  
)))

#zh[除了上述五个主要介词外，Mini 还使用了以下介词：]

#zh(example(
  [
    #columns(2, {
      table(
        [afa],
        [在……之后（after）],
        [ante],
        [在……之前（before）],
        [anti],
        [对抗、反对（against）],
        [inta],
        [在……之间（between）],
      )
      colbreak()
      table(
        [supa],
        [在……的上边（above）],
        [tila],
        [直到（until）],
        [unda],
        [在……的下边（under）],
        align(top)[via],
        [穿过、通过、超过 \ （through, across, over）],
      )
    })

    #v(1em)

    Mi i dona unda mesa a kosa.

    _我把东西放在桌子底下。_

    Via mundo, a mui man.

    _在世界各地，有很多人。_
  ],
))


