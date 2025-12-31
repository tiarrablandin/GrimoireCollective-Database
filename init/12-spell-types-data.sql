-- =============================================================================
-- GRIMOIRE COLLECTIVE - SPELL METHODS & ETHICS SEED DATA
-- =============================================================================
-- Purpose: Populate spell methods (the "how") and spell ethics (the "vibe")
-- Created: 2025-12-29
-- =============================================================================

-- =============================================================================
-- SPELL METHODS (The "How" - delivery systems and techniques)
-- =============================================================================

INSERT INTO spell_methods (name, slug, description, difficulty_level, typical_duration, materials_needed, instructions_summary, tips, warnings, related_methods) VALUES
    ('Candle Magick', 'candle-magick',
     'Using candles as a focal point for intention, with color, carving, anointing, and burning to release energy.',
     'beginner', 'Minutes to hours (burn time)',
     ARRAY['candles', 'matches/lighter', 'candle holder', 'optional: herbs, oils, carving tool'],
     'Choose candle color for intention. Cleanse and charge. Optional: carve symbols, anoint with oil, roll in herbs. Light with intention. Let burn safely (or snuff and relight daily).',
     'Never leave burning candles unattended. Use a fire-safe surface. Different colors correspond to different intentions. Speak or visualize your intention while the candle burns.',
     'Fire safety is paramount. Do not burn candles near flammable materials. Extinguish before leaving the room.',
     ARRAY['Vigil Candle', 'Tealight Spell', 'Seven-Day Candle']),
    
    ('Jar Spells', 'jar-spells',
     'Combining ingredients (herbs, crystals, written intentions, etc.) in a sealed container to "house" ongoing spell energy.',
     'beginner', 'Ongoing (days to years)',
     ARRAY['jar or bottle', 'herbs', 'crystals', 'paper and pen', 'optional: wax for sealing'],
     'Choose jar size. Layer ingredients with intention (herbs, stones, written wishes, etc.). Seal tightly. Optional: seal with wax. Keep in appropriate location or bury.',
     'Honey jars for sweetening, vinegar jars for souring, protection jars to keep, banishing jars to bury or discard. Shake periodically to "reactivate" or leave undisturbed.',
     'Be mindful of what you put in jars. Some practitioners advise against mixing opposing energies. Dispose respectfully when done.',
     ARRAY['Witch Bottle', 'Honey Jar', 'Vinegar Jar', 'Protection Jar']),
    
    ('Sigil Magick', 'sigil-magick',
     'Creating a unique symbolic representation of your intention and charging it with energy to activate.',
     'beginner', 'Minutes to create, instant to charge',
     ARRAY['paper', 'pen or pencil', 'optional: candle or burning method'],
     'Write intention statement. Remove vowels and duplicate letters. Arrange remaining letters into abstract symbol. Charge through meditation, burning, carrying, or other method. Release or destroy to activate.',
     'The more abstract and unrecognizable, the better (bypasses conscious mind). Charge with emotion/energy. Forget the original intention after activation for best results.',
     'Sigils work with your subconscious. Some methods involve destruction (burning) - do so safely.',
     ARRAY['Chaos Magick Sigils', 'Austin Osman Spare Method', 'Bind Runes']),
    
    ('Knot Magick', 'knot-magick',
     'Tying intentions into physical cord, string, or rope. Energy is stored in the knots and released when untied or burned.',
     'beginner', 'Minutes to tie, ongoing to release',
     ARRAY['cord, string, ribbon, or yarn', 'optional: beads, charms, herbs to weave in'],
     'Choose cord color for intention. Tie knots (often 9) while speaking incantation or intention with each knot. Store safely. Untie to release energy, or burn/bury to seal permanently.',
     'Traditional Witches Ladder uses 9 knots. "By knot of one, the spell has begun..." Wear as bracelet for ongoing effect or keep hidden.',
     'Don''t tie knots in anger - the energy stays until released. Untie deliberately or cut only if absolutely necessary.',
     ARRAY['Witch''s Ladder', 'Cord Magick', 'Knot Binding']),
    
    ('Kitchen Witchery', 'kitchen-witchery',
     'Infusing magical intention into food preparation, cooking, and baking. Food becomes the spell.',
     'beginner', 'Duration of cooking/baking',
     ARRAY['cooking ingredients', 'kitchen tools', 'intention and focus'],
     'Choose recipe aligned with intention. Stir clockwise (attracting) or counterclockwise (banishing). Speak intentions or incantations while cooking. Infuse with love and energy. Share or consume mindfully.',
     'Different herbs and ingredients have magical properties. Cinnamon for prosperity, rosemary for protection, etc. The act of feeding someone is inherently magical.',
     'If cooking for others, inform them if using unusual ingredients. Do not use kitchen witchery to manipulate others without consent.',
     ARRAY['Hearth Magick', 'Food Magick', 'Herbal Cooking']),
    
    ('Satchel/Mojo Bags', 'mojo-bag',
     'Small pouches filled with herbs, stones, and charms, carried on person or placed in specific locations.',
     'beginner', 'Ongoing (weeks to months)',
     ARRAY['small fabric pouch', 'herbs', 'crystals', 'personal items', 'optional: oil to feed'],
     'Choose pouch color. Add appropriate herbs, stones, and symbolic items (typically odd numbers: 3, 5, 7, 9). Tie closed. Carry in pocket, bra, under pillow, or place in location. "Feed" periodically with oil or breath.',
     'Traditionally never let anyone else touch your mojo bag. Refresh or remake when energy feels depleted. Different traditions have different rules.',
     'Respect cultural origins (particularly Hoodoo/rootwork traditions). Some mojo bags are meant to be secret/hidden.',
     ARRAY['Charm Bag', 'Gris-Gris', 'Medicine Pouch', 'Sachet']),
    
    ('Poppet Magick', 'poppet-magick',
     'Creating a doll or figure to represent a person, used for healing, protection, or (controversially) influence.',
     'intermediate', 'Hours to create, ongoing effect',
     ARRAY['fabric or clay', 'stuffing', 'needle and thread', 'personal concerns (hair, photo)', 'herbs and stones'],
     'Create human-shaped figure from cloth, wax, clay, or other material. If possible, add personal concerns from target. Stuff with appropriate herbs. Baptize/name the poppet. Work your intention on the poppet (healing touch, protective wrapping, etc.).',
     'Most commonly used for healing at a distance. Can be used for self-work by making poppet of yourself. Treat the poppet as you''d want the person treated.',
     'CONTROVERSIAL: Using poppets to harm or control others violates consent. Many traditions forbid harmful poppet work. Can trigger severe karmic return.',
     ARRAY['Doll Magick', 'Taglock Magick', 'Sympathetic Magick']),
    
    ('Bath/Ritual Bathing', 'ritual-bathing',
     'Using water infused with herbs, salts, and oils for cleansing, blessing, or magical transformation.',
     'beginner', '20-60 minutes',
     ARRAY['bathtub or basin', 'herbs', 'salts', 'essential oils', 'optional: candles, crystals'],
     'Draw bath at appropriate temperature. Add herbs (in sachet or loose), salts, and oils. Light candles, set intention. Enter mindfully. Visualize intention while soaking. Air dry or pat dry (don''t towel off completely).',
     'Take spiritual baths before major rituals or after negative experiences. Can also do foot baths or wash down with herb-infused water. Don''t drain until you''ve exited.',
     'Check for skin sensitivities to herbs and oils. Some herbs stain. Clean tub with natural cleaner after.',
     ARRAY['Cleansing Bath', 'Blessing Bath', 'Uncrossing Bath']),
    
    ('Petition Paper', 'petition-paper',
     'Writing your intention or petition on paper, often folded in a specific way and used in conjunction with other spell methods.',
     'beginner', 'Minutes to write',
     ARRAY['paper (parchment preferred)', 'pen (ink color matters)', 'optional: blood, oils, herbs to anoint'],
     'Write your petition clearly. Speak it aloud. Fold toward or away from you depending on intention (toward = attract, away = banish). May be burned, buried, carried, or placed in jar/under candle.',
     'Fold toward you 3 times to attract. Fold away 3 times to banish. Can rotate paper 90° between folds. Some use petition papers under candles, others burn them.',
     'Be specific but not limiting. "For the highest good of all" is a common addition. Don''t write petitions in anger.',
     ARRAY['Written Spell', 'Name Paper', 'Wish Paper']),
    
    ('Chanting/Incantation', 'chanting-incantation',
     'Using spoken or chanted words, rhymes, or songs to raise and direct energy.',
     'beginner', 'Minutes',
     ARRAY['voice', 'words/rhymes prepared or spontaneous'],
     'Compose or memorize your words (rhymes and rhythm help). Speak or chant with intention, emotion, and focus. Repeat as needed. May be whispered, spoken, or chanted loudly. Often combined with other methods.',
     'Rhyming helps memory and creates rhythm. Repetition builds energy. Volume and emotion matter more than perfect words. Can be simple: "By the power of three times three, as I will, so mote it be."',
     'Words have power. Speak carefully and intentionally. Avoid cursing in anger (your words may manifest).',
     ARRAY['Rhyming Spell', 'Spoken Charm', 'Chant Raising']),
    
    ('Visualization/Meditation', 'visualization-meditation',
     'Using focused mental imagery and meditative states to manifest intention and direct energy.',
     'intermediate', '10-60 minutes',
     ARRAY['quiet space', 'optional: meditation cushion, calming music'],
     'Enter meditative state through breath work. Visualize your intention as already manifested in vivid detail. Engage all senses. Feel the emotions of success. Hold the vision. Release to the universe. Ground afterward.',
     'Visualization is the foundation of much magick. Practice regularly to strengthen ability. Combine with other methods for amplification.',
     'Extended meditation without grounding can cause spaciness. Stay hydrated and eat after deep work.',
     ARRAY['Guided Meditation', 'Pathworking', 'Creative Visualization']),
    
    ('Smoke Cleansing', 'smoke-cleansing',
     'Using smoke from burning herbs or incense to cleanse spaces, objects, or people.',
     'beginner', '5-15 minutes',
     ARRAY['dried herbs or incense', 'fire-safe dish', 'matches/lighter', 'optional: feather for directing smoke'],
     'Light herbs or incense. Let flame die to smoldering. Use hand or feather to direct smoke around space, object, or person. Visualize negativity leaving with the smoke. Open windows to let energy exit.',
     'Common herbs: white sage (controversial/closed practice), rosemary, cedar, lavender, mugwort. Smoke rises, taking negative energy with it.',
     'CULTURAL SENSITIVITY: White sage and palo santo are closed/endangered. Use sustainable, culturally appropriate alternatives. Ensure proper ventilation.',
     ARRAY['Smudging', 'Incense Magick', 'Censing']),
    
    ('Crystal Grids', 'crystal-grids',
     'Arranging crystals in geometric patterns to amplify and direct energy toward a specific intention.',
     'intermediate', 'Minutes to hours to set up, ongoing effect',
     ARRAY['crystals', 'printed or drawn grid pattern', 'optional: central intention/photo'],
     'Choose sacred geometry pattern aligned with intention. Place central stone or intention. Arrange supporting crystals around pattern. Activate by connecting stones with wand or finger while stating intention.',
     'Flower of Life is versatile. Use multiples of 3, 6, or 9 stones. Leave undisturbed or add energy daily. Photograph before dismantling.',
     'Cleanse all stones before and after. Keep away from pets/children. Some prefer to activate under specific moon phases.',
     ARRAY['Crystal Arrangement', 'Sacred Geometry Grid', 'Altar Crystal Layout']),
    
    ('Sympathetic Magick', 'sympathetic-magick',
     'Working with the principle that "like affects like" - creating a representation of your target/goal and affecting it.',
     'intermediate', 'Varies',
     ARRAY['representation of target (photo, poppet, drawing)', 'items that symbolize intention'],
     'Create or obtain representation of target. Work your intention on the representation. What you do to the symbol affects the actual target/situation.',
     'Based on Law of Similarity (like creates like) and Law of Contagion (things once connected remain connected). Very effective but requires ethical consideration.',
     'ETHICS: Working on others without consent is controversial. Use primarily for self or with explicit permission. Consider karmic implications.',
     ARRAY['Poppet Magick', 'Image Magick', 'Taglock Work']),
    
    ('Cord Cutting', 'cord-cutting',
     'Ritual to sever energetic connections to people, situations, or habits that no longer serve.',
     'intermediate', '15-30 minutes',
     ARRAY['two candles', 'cord or string', 'scissors or knife', 'optional: representation of each party'],
     'Set up two candles (one for you, one for other person/situation). Tie cord between them. Light candles. State intention to release connection. Cut cord between candles. Let candles burn out. Dispose of cord away from home.',
     'Not the same as removing love - this releases unhealthy attachments while maintaining respect. Can be done for living or deceased connections.',
     'May bring up emotions. Have support available. Do not do cord cutting lightly - some connections are meant to stay (just healthier).',
     ARRAY['Banishing Ritual', 'Release Ceremony', 'Letting Go Spell']),
    
    ('Elemental Magick', 'elemental-magick',
     'Working directly with the classical elements (Earth, Air, Fire, Water, Spirit) as primary magical forces.',
     'intermediate', 'Varies',
     ARRAY['representations of elements', 'appropriate offerings', 'tools associated with each element'],
     'Call upon and work with elemental energies directly. Earth for grounding/prosperity, Air for communication/clarity, Fire for passion/transformation, Water for emotions/healing, Spirit for divine connection.',
     'Each element has specific correspondences, directions, colors, tools. Balance is key - don''t overwork one element without the others.',
     'Elemental forces are powerful. Show respect. Some practitioners believe elements are sentient. Always thank and dismiss properly.',
     ARRAY['Calling the Quarters', 'Elemental Invocation', 'Working with Elementals']),
    
    ('Moon Water', 'moon-water',
     'Charging water under the moon to absorb lunar energy, then using in spells, baths, or drinking.',
     'beginner', 'One night (moon phase specific)',
     ARRAY['glass container', 'fresh water', 'moonlight', 'optional: crystals'],
     'Fill glass container with water. Optional: add safe crystals. Place in direct moonlight overnight (specific phase for specific purposes). Retrieve before sun hits it. Use within lunar cycle.',
     'Full moon water is versatile. New moon for new beginnings. Waning for release. DO NOT drink if crystals were added (many are toxic). Use for anointing, cleansing, spell ingredients.',
     'Some crystals are toxic in water. Check safety. Don''t leave in sun (becomes sun water - different energy). May grow bacteria if stored long.',
     ARRAY['Sun Water', 'Storm Water', 'Blessed Water']),
    
    ('Taglocks', 'taglock-magick',
     'Using personal items (hair, nails, handwriting, photo) to create a magical link to a specific person.',
     'intermediate', 'Varies (used in other methods)',
     ARRAY['personal item from target', 'spell method to incorporate it into'],
     'Obtain taglock ethically. Incorporate into spell work (jar, poppet, etc.). Taglock creates strong sympathetic link to specific individual.',
     'Most powerful taglocks: hair, nails, blood, saliva, handwriting, worn clothing, photo. The more personal and recent, the stronger the link.',
     'ETHICS CRITICAL: Obtaining taglocks covertly or using for harmful purposes is deeply problematic. Get consent. Use primarily for healing/helping. Karmic return is potent with taglock work.',
     ARRAY['Personal Concerns', 'Sympathetic Links', 'Proxy Magick']);

-- =============================================================================
-- SPELL ETHICS (The "Vibe" - ethical categories and intensity)
-- =============================================================================

INSERT INTO spell_ethics (name, slug, category, description, ethical_considerations, intensity_level, is_controversial, wiccan_rede_compatible, threefold_law_warning, when_appropriate, alternatives, color) VALUES
    -- Magick Color Categories
    ('White Magick', 'white-magick', 'magick_color',
     'Magical work focused on healing, helping, blessing, and positive outcomes for all involved. Altruistic in nature.',
     'Generally accepted across all traditions. Focuses on "highest good of all." Does not manipulate free will or cause harm.',
     'minor', FALSE, TRUE, FALSE,
     'Healing work, blessings, protection, personal growth, helping others who have asked for assistance.',
     'N/A - this is the positive baseline.',
 '#22C55E'),
    
    ('Gray Magick', 'gray-magick', 'magick_color',
     'Practical magic that is neither inherently good nor evil. Self-interested work that doesn''t harm others. The "mundane" middle ground.',
     'Most everyday magic falls here. Getting a job, finding a parking spot, prosperity work. Benefits you but doesn''t hurt others.',
     'minor', FALSE, TRUE, FALSE,
     'Personal prosperity, job seeking, luck work, self-improvement, attracting opportunities. Any work that helps you without harming others.',
     'Always consider if your gain is at another''s expense. If so, reconsider.',
 '#6B7280'),
    
    ('Black Magick', 'black-magick', 'magick_color',
     'Magical work intended to cause harm, control, manipulate, or act against another''s free will. Generally considered "dark" or "left-hand path."',
     'HIGHLY CONTROVERSIAL. Wiccans and Rede-followers avoid entirely. Other practitioners view as valid for justice/defense. Consider karmic implications carefully.',
     'severe', TRUE, FALSE, TRUE,
     'Some practitioners use for justice when legal system fails, protection against active threats, or in self-defense. Many practitioners never use at all.',
     'Protection work, boundary setting, freezer spells (less harmful), seeking legal justice, cutting cords.',
 '#1F2937'),
    
    -- Harmful/Controversial Specific Categories
    ('Jinx', 'jinx', 'harmful',
     'A minor "bad luck" spell or curse. Typically short-term annoyance rather than serious harm. The lightest form of negative magick.',
     'Still considered harmful work. Intent matters. Even minor negativity can escalate or backlash. Many traditions discourage.',
     'minor', TRUE, FALSE, TRUE,
     'Rarely appropriate. Perhaps for a harmless prank (shoelaces untying, minor inconveniences) among consenting friends. Most practitioners avoid.',
     'Focus on your own protection and success rather than diminishing others.',
 '#F59E0B'),
    
    ('Hex', 'hex', 'harmful',
     'A more serious negative spell, often used for justice or "return to sender" purposes. Intended to bring bad luck or consequences.',
     'CONTROVERSIAL. Some view as justified when legal recourse fails. Others see as violating core principles. Threefold Law concerns.',
     'serious', TRUE, FALSE, TRUE,
     'When someone has done serious harm, legal system won''t help, and you need to stop ongoing damage. "May they receive what they''ve given" approach.',
     'Binding (prevents harm without harming), freezer spell, mirror shield (reflects back), strong boundary work, legal action.',
 '#EF4444'),
    
    ('Curse', 'curse', 'harmful',
     'Heavy, long-term intention of significant harm. The most severe form of harmful magick. Creates lasting negative effects.',
     'EXTREMELY CONTROVERSIAL. Most practitioners never curse. Those who do reserve it for severe situations. Karmic return is substantial.',
     'severe', TRUE, FALSE, TRUE,
     'Virtually never appropriate. Perhaps in extreme cases of ongoing abuse where all other methods have failed and lives are at stake.',
     'ANYTHING ELSE. Seriously. Binding, protection, distance, legal action, physical safety measures. Curses should be absolute last resort.',
 '#7F1D1D'),
    
    ('Binding', 'binding', 'neutral',
     'Restricting someone''s ability to cause harm without causing harm to them. Prevents action rather than punishing.',
     'More ethically defensible than hexes/curses. Doesn''t harm, just prevents. Still involves working on another without consent.',
     'moderate', TRUE, TRUE, FALSE,
     'When someone is actively causing harm to you or others, and you need to stop the behavior without harming them. Think "magical restraining order."',
     'Strong personal boundaries, protection work, physical distance, legal restraining order.',
 '#6B7280'),
    
    -- Neutral/Descriptive Categories
    ('Banishing', 'banishing', 'neutral',
     'Forcefully removing unwanted energy, habits, people, or situations from your life. Clearing what doesn''t serve.',
     'Generally accepted as self-protection and self-care. Different from harmful work because focus is on removing from YOUR space, not harming them.',
     'moderate', FALSE, TRUE, FALSE,
     'Removing negative energy, breaking bad habits, ending toxic relationships, clearing spiritual attachments, removing obstacles.',
     'Gentler releasing work, cord cutting, cleansing, simply creating distance.',
 '#06B6D4'),
    
    ('Manipulation', 'manipulation', 'harmful',
     'Spells designed to control another person''s thoughts, feelings, or actions against their natural will.',
     'MAJOR ETHICAL VIOLATION. Includes love spells on specific people, job spells to make someone choose you over others, etc. Interferes with free will.',
     'serious', TRUE, FALSE, TRUE,
     'Never appropriate. Free will violation is considered deeply problematic in most traditions.',
     'Attraction work (drawing love IN rather than targeting specific person), working on yourself to be best candidate, glamour work on yourself.',
 '#DC2626'),
    
    ('Justice Work', 'justice-work', 'neutral',
     'Spells seeking truth, fairness, or appropriate consequences. Often invokes divine justice rather than personal revenge.',
     'More acceptable than revenge. Seeks balance and truth rather than harm. "May truth come to light" vs "May they suffer."',
     'moderate', FALSE, TRUE, FALSE,
     'Legal situations, finding truth, ensuring fairness, court cases, when wrongs need to be righted but you leave exact consequences to karma/universe.',
     'Legal action, truth-seeking work, personal healing from injustice.',
 '#6366F1'),
    
    ('Glamour', 'glamour', 'neutral',
     'Spells affecting perception - making yourself appear more confident, attractive, or authoritative in others'' eyes.',
     'When done on yourself, generally fine. When used to deceive or manipulate perceptions unethically, problematic.',
     'minor', FALSE, TRUE, FALSE,
     'Job interviews, first dates, presentations, situations where you want your best self to shine through. Enhancing natural qualities.',
     'Working on genuine self-confidence, actual skill building, being authentically yourself.',
 '#EC4899'),
    
    ('Sweetening', 'sweetening', 'neutral',
     'Using "sweet" ingredients (honey, sugar) to make a person or situation more favorable toward you. Honey jar spells.',
     'Gentle influence. Less controlling than manipulation but still affecting another''s disposition. Consider if it''s nudging or controlling.',
     'minor', TRUE, TRUE, FALSE,
     'Smoothing difficult relationships, helping grumpy bosses be more reasonable, making stressful situations easier. "Take the edge off" rather than control.',
     'Communication skills, addressing issues directly, finding compromise, working on your own responses.',
 '#F59E0B'),
    
    ('Crossing', 'crossing', 'harmful',
     'Southern folk magic term for sending negative energy or "crossing someone up" - similar to hexing.',
     'Part of Hoodoo/rootwork tradition. Used for justice or defense. Not to be taken lightly. Practitioners trained in when/how.',
     'serious', TRUE, FALSE, TRUE,
     'In traditions where this is practiced: justice work, stopping harm, protection. Requires training and understanding of tradition.',
     'Uncrossing (removing crossings), protection, binding, traditional justice work.',
 '#DC2626'),
    
    ('Defensive Magick', 'defensive-magick', 'neutral',
     'Protective work in response to active threats or attacks. Shields, wards, return-to-sender.',
     'Generally accepted as valid self-defense. Difference between offensive (attacking) and defensive (protecting).',
     'moderate', FALSE, TRUE, FALSE,
     'When under active magical or psychic attack, dealing with negative energy directed at you, protecting from known threats.',
     'Prevention through regular cleansing/protection, distance from toxic people, professional help if needed.',
 '#14B8A6'),
    
    ('Love Spell', 'love-spell', 'harmful',
     'Spells targeting a SPECIFIC person to make them love you or feel attracted to you.',
     'MAJOR CONTROVERSY. Interferes with free will. Rede followers avoid completely. Results are often problematic - forced love isn''t real.',
     'serious', TRUE, FALSE, TRUE,
     'Generally NOT appropriate. If you must: only on yourself (self-love), or general "draw my perfect match" without targeting anyone specific.',
     'Self-love work, removing personal blocks to love, "draw compatible partner" (not specific person), glamour on yourself, actual communication.',
     '#FFB3C1');

-- Add missing intentions related to spell types that weren't already in the system
-- NOTE: Related elements linked via intention_elements junction table
-- NOTE: Moon phases linked via intention_moon_phases junction table
-- NOTE: Colors removed - use UI theming or tag system instead
INSERT INTO intentions (name, slug, description, category, keywords, usage_guide) VALUES
    ('Glamour', 'glamour', 'Enhancing how others perceive you through magical means', 'expression',
     ARRAY['illusion', 'perception', 'beauty', 'confidence', 'appearance'],
     'Work on yourself, not others. Enhance natural qualities rather than create false impressions. Good for interviews, dates, performances.'),
    
    ('Sweetening', 'sweetening', 'Making people or situations more favorable and kind toward you', 'relationships',
     ARRAY['honey', 'sugar', 'gentle influence', 'favor', 'disposition'],
     'Use honey or sugar in spells to "sweeten" someone''s disposition. Ethical when used to smooth relationships, not control them.')
ON CONFLICT (slug) DO NOTHING; -- Skip if already exists
