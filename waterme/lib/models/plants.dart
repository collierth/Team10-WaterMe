import 'package:flutter/material.dart';

class Plant {
  String name;
  String staticName;
  String species;
  String description;
  int waterCycle;

  Plant (
    {required this.name, required this.staticName, required this.species, required this.description, required this.waterCycle}
    );
}

  List<Plant> plantList = [
    Plant(
    name: "Amaryllis",
    staticName: "Amaryllis",
    species: "Hippeastrum",
    description: "Bulb flowering type plants that produce a cluster of attractive trumpet like flowers in different color variations.", 
    waterCycle: 14, 
      ),
    Plant(
    name: "African Violet", 
    staticName: "African Violet",
    species: "Saintpaulia",
    description: "One of the most popular flowering house plants from the saintpaulia genus. The genus has about 20 species and thousands of varieties.", 
    waterCycle: 7, 
      ),
    Plant(
    name: "Arrowhead",
    staticName: "Arrowhead", 
    species: "Nephthytis Podophyllum",
    description: "Native to South America, this species of plant has various cultivars with different amounts of variegation, from entirely green to near white. They can be sold under the the name Nephthytis podophyllum. An interesting growth pattern of the leaves is they begin cordate (heart) shaped then develop into the arrow shape and further on in age become palmate (similar shape to a hand). Because the plant matures into a climbing vine it will need to be cut back to prevent growth becoming wild and difficult to manage, indoors. ", 
    waterCycle: 10, 
      ),
    Plant(
    name: "Chinese Evergreen", 
    staticName: "Chinese Evergreen",
    species: "A. commutatum, A. modestum",
    description: "There are many hybrid varieties of the Chinese evergreen available which have been cultivated over the last century. This is because of their increasing popularity for indoor growers to use them as ornamental plants for room decoration. These slow growing plant varieties includes, plain green, speckled, blotched and variegated types. One of the most popular and sought after is the silver queen which has leaves covered in silver mainly with some small green patches.", 
    waterCycle: 7, 
      ),
    Plant(
    name: "Christmas Cactus",
    staticName: "Christmas Cactus", 
    species: "Schlumbergera Bridgesii",
    description: "The parent plant of the Christmas Cactus (this is a hybrid) is native to South America that grows in the mountains of Brazil. It's tropical nature commonly confuses growers into offering too much heat and light, without enough water. This cactus produces small, flat stem segments that are roundish in nature, with minor serrations on both sides. They flower from the end of these segments. The Christmas variety has neon pink pollen-bearing stamen. Along with the December blooming preference, this is the Cactus's defining feature. ", 
    waterCycle: 7, 
      ),
    Plant(
    name: "Golden Pothos",
    staticName: "Golden Pothos", 
    species: "Epipremnum aureum",
    description: "This plant is a native of Australia, Indonesia, China, Japan and India. Despite its already wide natural range, it has been imported to locations all over the globe. Although it does wonderfully as a house plant, growing it outdoors is illegal in some states, as it has been declared an invasive species. When growing in the wild, this plant attaches itself to other items through aerial roots. It then sends shoots of stems down until it reaches the soil beneath it, where the stems themselves take root and begin to grow across the ground. In the wild, this plant will grow up to 66 feet tall.", 
    waterCycle: 14, 
      ),
    Plant(
    name: "Philodendron",
    staticName: "Philodendron", 
    species: "Philodendron scandens",
    description: "The Philodendron scandens is native to Mexico, Brazil and the West Indies and is one of the most common and popular species of Philodendron sold today. It is part of the Aracae family and is known as a vine and climber due to its ability to grow to huge heights given the right conditions. These plants are naturally found in humid tropical rainforests but they are also found in swamps and river banks. It is a versatile plant that can be grown in a number of different conditions which makes it perfect for both outdoor growing and indoor growing. ", 
    waterCycle: 9, 
      ),
    Plant(
    name: "Lucky Bamboo",
    staticName: "Lucky Bamboo", 
    species: "Dracaena Braunii",
    description: "The lucky bamboo grown in it's native country (West Africa) can grow up to 5ft tall (or much more), and as a house plant up to approximately 2 or 3 feet. There are various cultivars of this plant and some of the most interesting are the twisted stalk types which are trained by specialist growers. The name lucky seems to have been given by the Chinese that practice feng shui and believe in this plant brings good fortune into a home or workplace.", 
    waterCycle: 17, 
      ),
    Plant(
    name: "Calathea",
    staticName: "Calathea", 
    species: "Calathea Ornata",
    description: "Calathea Ornata is a plant that is native to South America and seen in many tropical climates such as Thailand. There are several members of the same family and they are all known for their large leaves, all of which have patterns that are extremely noticeable whilst their colors are stunning. This is a plant that looks attractive indoors but it is also possible to keep outdoors and can bring many different areas to life such as patio’s, porches and decking. It can also be planted in beds and borders. Due to its foliage, this is a superb plant to put among other plants that have large foliage.", 
    waterCycle: 5, 
      ),
    Plant(
    name: "Boston Fern",
    staticName: "Boston Fern", 
    species: "Nephrolepis Exaltata",
    description: "Compared to most other ferns your going to find this plant a lot easier to care for in regards to light, humidity levels and propagating (see care instructions below). Some ferns can only be grown in terrariums and others will not recover from neglect.....unlike this species that can be brought back from what looks like near death. As mentioned above the fronds on the Boston fern arch over and grow up to about 3 ft long. The fronds are made up of a tough leaf stalk, pinnate leaflets and a rachis (leaf stalk), but in layman's terms it's a kind of long stalk with lots of small leaves on it, side-by-side....or you could say they have a large feather like appearance.", 
    waterCycle: 3, 
      ),
    Plant(
    name: "ZZ Plant",
    staticName: "ZZ Plant", 
    species: "Zamioculcas zamiifolia",
    description: "The ZZ plant grows similar to tree plants or palms and has stems with many leaves growing from these stems. The leaves are a fleshy type which are only a couple of inches in length and an inch or so wide. Some of these stems from the same plant grow straight up and then others arch over, which may encourage you to prune odd looking stems to keep the plant looking full and shaped well. As mentioned above the plant tolerates low light, bright light and different levels of watering. However, watering depends on how much light it receives (i.e., less light = less water and more light = more water).", 
    waterCycle: 14, 
      ),
    Plant(
    name: "Umbrella Tree",
    staticName: "Umbrella Tree", 
    species: "Schefflera Arboricolum",
    description: "The umbrella plant is a multi trunk tree that can grows over 15 metres tall outdoors and has to be pruned and topped at some point to keep its size manageable within a home. Its close relative () Schefflera Actinophylla) has to carefully planted because of its invasive nature and is seen as a weed in certain places. Basic care and maintenance will keep this plant looking healthy and living a long long life indoors. It's a plant which less is more, concerning watering and feeding - too much of these will cause plant problems. ", 
    waterCycle: 7, 
      ),
    Plant(
    name: "Canary Date Palm",
    staticName: "Canary Date Palm", 
    species: "Phoenix Canariensis",
    description: "The Canary date palm is a popular ornamental plant grown outdoors in tropical, sub-tropical and in some warmer temperate regions. While it grows up to 20 metres in it's native Mediterranean habitat the indoor variety can be kept at a more manageable height, of 6ft tall. This slow growing feather type palm is best suited to growing in a greenhouse or conservatory and can be moved outdoors on a patio when temperatures rise in temperate regions.", 
    waterCycle: 9, 
      ),
    Plant(
    name: "Cast Iron Plant",
    staticName: "Cast Iron Plant", 
    species: "Aspidistra elatior",
    description: "A native to Japan and Taiwan the Aspidistra elatior is a hardy garden plant and very easy to grow ornamental plant for indoors. It has been known to bloom tiny flowers near the base of the foliage, although this seems to be a very rare occasion for growers - so its mainly grown for its foliage. There is a green foliage type and a variegated that displays cream colored stripes along the outer edge and/or the center of each leaf. The base of the leaves are rolled, then opens out and narrows in to a point. The linear leaves grow over a foot long and 5 inches wide - which display prominent ribs.", 
    waterCycle: 9, 
      ),
    Plant(
    name: "Century Plant",
    staticName: "Century Plant", 
    species: "Agave americana",
    description: "The Agave americana also goes by the common names of American aloe or century plant. It is part of the Asparagaceae family and can be found in areas that range from South America to Mexico. It's also known as Agave cactus, but it is not a cacti plant, just has some similarities. As this is a plant that requires full sun it will need to be displayed in a spot that has full sun and is also sheltered. It is commonly found in Architectural City and Courtyard Gardens along with Coastal Patios and containers.", 
    waterCycle: 12, 
      ),
    Plant(
    name: "Jade Plant",
    staticName: "Jade Plant", 
    species: "C. portulacea",
    description: "The Jade is grown indoors and borrows itself from the bonsai in the way it grows like a miniature tree, with a trunk and branches. It is also a succulent that will retain water well within the leaves, just like the cactus plant. This succulent is a hardy fellow and has two main requirements for a healthy long life, which is water and plenty of light. They are both an indoor and outdoor species, although conditions outside need to be right (enough heat and sun).", 
    waterCycle: 21, 
      ),
    
      
  ];
  