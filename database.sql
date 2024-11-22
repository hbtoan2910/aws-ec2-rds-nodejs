DROP DATABASE IF EXISTS lotr;

CREATE DATABASE lotr;

USE lotr;

CREATE TABLE characters (
  id integer PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  details VARCHAR(255) NOT NULL
);

INSERT INTO
  characters (name, details)
values
  (
    "Aragorn",
    " Descendant of Isildur who was a principal figure in both the Fellowship of the Ring and the War of the Ring.  Became king over the reunited kingdoms of Gondor and Arnor."
  ),
  (
    "Arwen",
    " Daughter of Elrond Half-elven and Celebrían, marries Aragorn at the end of the War of the Ring and becomes queen of the reunited kingdoms of Gondor and Arnor."
  ),
  (
    "Bilbo Baggins",
    " A hobbit adventurer.  Discovered the One Ring after its loss by Gollum."
  ),
  (
    "Frodo Baggins",
    " Cousin (informally, 'nephew') of Bilbo Baggins who bore the One Ring to its destruction in Mount Doom."
  ),
  (
    "Balin",
    " Dwarf companion of Thorin Oakenshield in The Hobbit.  Slain during an attempt to retake Moria."
  ),
  (
    "Bard the Bowman",
    " Man of Esgaroth who slayed Smaug the dragon."
  ),
  (
    "Beorn",
    " Skin-changer who resides in the region of Mirkwood and takes the form of a great bear."
  ),
  (
    "Boromir",
    " Member of the Fellowship of the Ring, son and heir to Denethor II of Gondor. Slain by Uruk-hai at Amon Hen."
  ),
  (
    "Merry Brandybuck",
    " A hobbit member of the Fellowship of the Ring and companion of Frodo Baggins. Assisted Éowyn in the slaying of the Witch-King of Angmar."
  ),
  (
    "Celebrimbor",
    " Noldorin smith and grandson of Fëanor, who led the creation of all but one of the twenty Rings of Power. Tortured to death by Sauron."
  ),
  (
    "Denethor",
    " Steward of Gondor during the events of the Lord of the Rings. Committed suicide during the Siege of Gondor."
  ),
  (
    "Eärendil and Elwing",
    " Half-elven couple, heroes of the War of Wrath as well as the progenitors of the royal Númenorean and Dúnedain bloodlines through their sons Elrond and Elros."
  ),
  (
    "Elendil",
    " Númenorean nobleman whose sons founded the kingdoms of Arnor and Gondor in Middle-earth. Slain during the final battle between Sauron and the Last Alliance of Elves and Men."
  ),
  (
    "Elrond",
    " Ruler of the elven refuge of Rivendell. Son of the Half-elves Eärendil and Elwing, husband of Celebrian, father of Arwen, Elladan and Elrohir."
  ),
  (
    "Éomer",
    " Brother of Éowyn, nephew and heir of Théoden, King of Rohan. Son-in-law of Prince Imrahil of Dol Amroth."
  ),
  (
    "Éowyn",
    " Sister of Éomer and member of the royal house of Rohan. Slayer of the Witch King of Angmar. Married Faramir after the War of the Ring."
  ),
  (
    "Faramir",
    " Son of Denethor II of Gondor, brother of Boromir, and husband of Éowyn following the War of the Ring."
  ),
  (
    "Fëanor",
    " Son of Finwë and Míriel. The greatest Noldorin smith to have ever lived, he forged the three jewels known as Silmarils. Slain by Balrogs."
  ),
  (
    "Finrod Felagund",
    " Grandson of Finwë and Elvenking of Nargothrond. He died from wounds sustained by saving his friend Beren from a werewolf."
  ),
  (
    "Finwë and Míriel",
    " Parents of Fëanor and leaders of the Noldorin migrants to the Undying Lands. Míriel dies at childbirth，while Finwë is slain by Morgoth."
  ),
  (
    "Galadriel",
    " Co-ruler of Lothlórien alongside her husband Celeborn. Relative of numerous notable characters in Tolkien's legendarium through bloodline and kinship."
  ),
  (
    "Samwise Gamgee",
    " Loyal companion of Frodo Baggins during his journey to Mordor to destroy the One Ring."
  ),
  (
    "Gandalf",
    " A wizard.  A member of the Fellowship of the Ring.  Killed in battle in Moria, but returns to play a leading role in the defeat of Sauron."
  ),
  (
    "Glorfindel",
    " Noldorin elf-lord notable for his death and resurrection within Tolkien's legendarium."
  ),
  (
    "Gimli",
    " Dwarven member of the Fellowship of the Ring and a major character in The Lord of the Rings."
  ),
  (
    "Goldberry",
    " Mysterious entity known as the River-woman's daughter, wife of Tom Bombadil."
  ),
  (
    "Gollum",
    " Possessor of the One Ring until taken by Bilbo Baggins.  Falls into the Crack of Doom after retaking the ring from Frodo Baggins."
  ),
  (
    "Gríma Wormtongue",
    " An ally of Saruman who gave false advice to Théoden, King of Rohan. Slain by hobbit militia during the Scouring of the Shire."
  ),
  (
    "Húrin",
    " Human warrior of the First Age, and the father of Túrin Turambar."
  ),
  (
    "Isildur",
    " Son of Elendil, and co-founder of the kingdom of Gondor. Took the One Ring from Sauron at the end of the Second Age, but was later slain at the Disaster of the Gladden Fields."
  ),
  (
    "Legolas",
    " Elven member of the Fellowship of the Ring and a major character in The Lord of the Rings."
  ),
  (
    "Lúthien and Beren",
    " The ancestors of the Half-elven bloodline."
  ),
  (
    "Maedhros",
    " Noldorin elf lord and eldest of the Sons of Fëanor. Committed suicide after recovering one of the lost Silmarils."
  ),
  (
    "Melian",
    " Maia who took the physical form of an Elf. Queen of Doriath in the First Age. Wife of Elu Thingol and mother of Lúthien."
  ),
  (
    "Morgoth",
    " The first Dark Lord in Tolkien's legendarium, originally known as Melkor. Succeeded by Sauron after his defeat and banishment by the Valar following the War of Wrath."
  ),
  (
    "Radagast",
    " one of the Five Istari or Wizards who has an affinity with nature."
  ),
  (
    "Saruman",
    " A wizard.  Once the leader of the Istari, he attempted to form his own empire as a rival of Sauron and was defeated at the Battle of the Hornburg. Murdered by Gríma Wormtongue during the Scouring of the Shire."
  ),
  (
    "Sauron",
    " The primary antagonist of The Lord of the Rings.  He crafted the One Ring, and was destroyed upon its destruction at the end of The Return of the King."
  ),
  (
    "Shelob",
    " Monstrous spider and last notable spawn of Ungoliant."
  ),
  (
    "Smaug",
    " A dragon and primary antagonist of The Hobbit.  Slain by Bard the Bowman."
  ),
  (
    "Théoden",
    " King of Rohan, uncle of Éomer and Éowyn. Fell in battle during the Battle of the Pelennor Fields."
  ),
  (
    "Thingol",
    " Elvenking of the Sindarin realm of Doriath in the First Age. Husband of Melian and father of Lúthien. Slain by dwarves over a dispute concerning one of the Silmarils."
  ),
  (
    "Thranduil",
    " Elvenking of the Silvan realm of Mirkwood, father of Legolas."
  ),
  (
    "Thorin Oakenshield",
    " Dwarf noble who led the company of dwarves that retook Erebor from the dragon Smaug in The Hobbit. Slain during the Battle of the Five Armies."
  ),
  (
    "Tom Bombadil",
    " A mysterious figure who aided the hobbits during their departure from the Shire in The Fellowship of the Ring."
  ),
  (
    "Pippin Took",
    " A hobbit member of the Fellowship of the Ring and companion of Frodo Baggins. Served as a Guard of the Citadel of Minas Tirith during the War of the Ring."
  ),
  (
    "Treebeard",
    " Leader of the Ents in The Lord of the Rings."
  ),
  (
    "Tuor and Idril",
    " Heroes of the First Age and parents of Eärendil as the second married union of Men and Elves. Left Middle-earth for Valinor, where Tuor is said to be counted amongst the Elven kindreds."
  ),
  (
    "Túrin Turambar",
    " A First Age hero who is embroiled in a tragic fate along with the rest of his family and ultimately committed suicide."
  ),
  (
    "Ungoliant",
    " Monstrous spider spirit. Progenitor of the Great Spiders and of Shelob."
  ),
  (
    "Watcher in the Water",
    " A mysterious aquatic creature who lives in a pool guarding the gates of Moria."
  );