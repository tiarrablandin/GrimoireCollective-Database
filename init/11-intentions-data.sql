-- =============================================================================
-- GRIMOIRE COLLECTIVE - INTENTIONS DATA
-- =============================================================================
-- Purpose: Complete set of all magical intentions available in the system
-- Dependencies: Requires 03-entity-tables.sql (intentions table definition)
-- Note: Contains both base intentions and entity-specific intentions.
--       Organized by category for easy reference.
--
-- NOTE: Related elements are linked via intention_elements junction table
-- NOTE: Moon phases are linked via intention_moon_phases junction table
-- NOTE: Colors removed - use UI theming or tag system instead
-- =============================================================================

INSERT INTO intentions (name, slug, description, category, keywords, usage_guide) VALUES
    -- Protection & Safety
    ('Protection', 'protection', 'Shielding from negative energy, harm, or unwanted influences', 'protection',
     ARRAY['shield', 'ward', 'defense', 'safety', 'boundaries'],
     'Use for creating protective barriers, warding spaces, deflecting negativity, and maintaining energetic boundaries. Works well with visualization and intention-setting.'),
    
    ('Banishing', 'banishing', 'Removing negative energy, habits, or influences from your life', 'protection',
     ARRAY['removal', 'clearing', 'release', 'expel'],
     'Work during waning moon phases to release what no longer serves. Combine with cleansing for maximum effect.'),
    
    ('Cleansing', 'cleansing', 'Purifying energy, spaces, or objects', 'protection',
     ARRAY['purification', 'clearing', 'sanctification', 'renewal'],
     'Essential before and after magical work. Use smoke, water, sound, or visualization to cleanse spaces and tools.'),
    
    -- Love & Relationships
    ('Love', 'love', 'Attracting or strengthening romantic love', 'relationships',
     ARRAY['romance', 'passion', 'attraction', 'partnership'],
     'Focus on self-love first. For attracting love, work during waxing moon. For strengthening existing relationships, use full moon energy.'),
    
    ('Self-Love', 'self-love', 'Cultivating love, acceptance, and compassion for yourself', 'relationships',
     ARRAY['self-care', 'acceptance', 'confidence', 'worth'],
     'The foundation of all other love work. Practice daily affirmations, mirror work, and gentle self-care rituals.'),
    
    ('Friendship', 'friendship', 'Attracting or strengthening platonic relationships', 'relationships',
     ARRAY['companionship', 'connection', 'community', 'bonds'],
     'Focus on authentic connection and mutual support. Good for building community and strengthening existing friendships.'),
    
    -- Prosperity & Success
    ('Prosperity', 'prosperity', 'Attracting wealth, abundance, and financial success', 'abundance',
     ARRAY['wealth', 'money', 'riches', 'financial'],
     'Combine with practical action. Work during waxing moon to draw prosperity in. Focus on gratitude for current abundance.'),
    
    ('Abundance', 'abundance', 'Attracting plenty in all areas of life', 'abundance',
     ARRAY['plenty', 'overflow', 'blessings', 'wealth'],
     'Broader than just money - includes love, health, opportunities, joy. Cultivate abundance mindset through gratitude.'),
    
    ('Success', 'success', 'Achieving goals and ambitions', 'abundance',
     ARRAY['achievement', 'victory', 'accomplishment', 'goals'],
     'Set clear intentions and back magic with action. Use for job interviews, tests, competitions, or personal goals.'),
    
    ('Employment', 'employment', 'Finding or maintaining work', 'abundance',
     ARRAY['job', 'career', 'work', 'vocation'],
     'Prepare resume and applications first, then enhance with magical work. Focus on right opportunity, not just any job.'),
    
    -- Healing & Health
    ('Healing', 'healing', 'Physical, emotional, or spiritual healing', 'healing',
     ARRAY['recovery', 'wellness', 'health', 'wholeness'],
     'Never replace medical care with magic. Use to support healing process and maintain positive mindset. Consult healthcare providers.'),
    
    ('Peace', 'peace', 'Bringing calm, tranquility, and inner peace', 'healing',
     ARRAY['calm', 'tranquility', 'serenity', 'stillness'],
     'Essential for mental health and spiritual growth. Practice meditation and create peaceful spaces.'),
    
    ('Balance', 'balance', 'Achieving harmony and equilibrium', 'healing',
     ARRAY['harmony', 'equilibrium', 'stability', 'centeredness'],
     'Work with all elements equally. Focus on balancing aspects of life - work/rest, giving/receiving, physical/spiritual.'),
    
    ('Sleep', 'sleep', 'Promoting restful sleep and dreams', 'healing',
     ARRAY['rest', 'dreams', 'insomnia', 'relaxation'],
     'Create bedtime rituals, use calming herbs, keep sleep space peaceful. Good for dream work and astral travel.'),
    
    -- Spiritual & Psychic
    ('Intuition', 'intuition', 'Enhancing psychic abilities and inner knowing', 'spiritual',
     ARRAY['psychic', 'inner wisdom', 'sixth sense', 'gut feeling'],
     'Trust your first impressions. Practice daily with divination tools. Keep dream journal. Meditate regularly.'),
    
    ('Divination', 'divination', 'Seeking knowledge through magical means', 'spiritual',
     ARRAY['fortune telling', 'prophecy', 'scrying', 'oracle'],
     'Use tarot, runes, pendulum, or other tools. Full moon is most powerful. Clear and charge tools regularly.'),
    
    ('Meditation', 'meditation', 'Deepening meditative practice and spiritual connection', 'spiritual',
     ARRAY['contemplation', 'mindfulness', 'spiritual practice'],
     'Daily practice is key. Create dedicated space. Start with just 5-10 minutes. Use tools that help you focus.'),
    
    ('Psychic Abilities', 'psychic-abilities', 'Developing extrasensory perception', 'spiritual',
     ARRAY['ESP', 'clairvoyance', 'telepathy', 'precognition'],
     'Practice exercises daily. Trust your abilities. Protect yourself before psychic work. Ground after sessions.'),
    
    ('Spirit Communication', 'spirit-communication', 'Connecting with spirits, ancestors, or guides', 'spiritual',
     ARRAY['mediumship', 'channeling', 'ancestors', 'guides'],
     'Practice proper protection. Set clear boundaries. Honor ancestors. Work respectfully. Ground thoroughly after.'),
    
    ('Astral Projection', 'astral-projection', 'Conscious out-of-body experiences', 'spiritual',
     ARRAY['astral travel', 'OBE', 'soul travel', 'journeying'],
     'Advanced practice. Ensure safety of physical body. Use protective measures. Start with guided meditations.'),
    
    -- Transformation & Growth
    ('Transformation', 'transformation', 'Major life changes and personal evolution', 'growth',
     ARRAY['change', 'rebirth', 'metamorphosis', 'evolution'],
     'Embrace change as natural. Release old patterns. Work during transitions like Samhain or personal birthdays.'),
    
    ('Growth', 'growth', 'Personal development and expansion', 'growth',
     ARRAY['development', 'learning', 'expansion', 'maturity'],
     'Set intentions for areas you want to develop. Combine magical work with practical learning and practice.'),
    
    ('Wisdom', 'wisdom', 'Gaining knowledge and understanding', 'growth',
     ARRAY['knowledge', 'understanding', 'insight', 'enlightenment'],
     'Study, meditate, learn from elders. Combine book learning with experiential wisdom. Keep journals.'),
    
    ('Courage', 'courage', 'Building bravery and facing fears', 'growth',
     ARRAY['bravery', 'strength', 'valor', 'boldness'],
     'Start small. Face fears gradually. Use before challenging situations. Combine with grounding for balance.'),
    
    ('Endurance', 'endurance', 'Sustaining effort and perseverance over time', 'growth',
     ARRAY['perseverance', 'stamina', 'resilience', 'persistence'],
     'Pace yourself. Build gradually. Stay consistent. Rest when needed but keep going.'),
    
    ('Confidence', 'confidence', 'Building self-assurance and self-esteem', 'growth',
     ARRAY['self-esteem', 'assurance', 'self-belief', 'empowerment'],
     'Practice affirmations. Work on solar plexus chakra. Stand in power poses. Celebrate small victories.'),
    
    -- Creativity & Expression
    ('Creativity', 'creativity', 'Enhancing creative abilities and inspiration', 'expression',
     ARRAY['inspiration', 'artistry', 'innovation', 'imagination'],
     'Keep supplies ready. Create sacred creative space. Honor the muse. Regular practice is key.'),
    
    ('Communication', 'communication', 'Improving expression and connection', 'expression',
     ARRAY['speech', 'expression', 'clarity', 'articulation'],
     'Work on throat chakra. Practice clear intention. Use before important conversations or presentations.'),
    
    ('Inspiration', 'inspiration', 'Invoking creative and spiritual inspiration', 'expression',
     ARRAY['muse', 'divine inspiration', 'creativity', 'vision'],
     'Create space for inspiration to arrive. Don''t force it. Be open to messages from unexpected sources.'),
    
    -- Miscellaneous
    ('Luck', 'luck', 'Attracting good fortune', 'abundance',
     ARRAY['fortune', 'serendipity', 'chance', 'blessing'],
     'Combine with gratitude and positive mindset. Use before gambling, competitions, or risky ventures.'),
    
    ('Fertility', 'fertility', 'Encouraging fertility and new beginnings', 'abundance',
     ARRAY['conception', 'pregnancy', 'creation', 'new life'],
     'Can be literal (pregnancy) or symbolic (new projects). Honor the cycle of creation. Work with Earth energy.'),
    
    ('Beauty', 'beauty', 'Enhancing physical beauty and attractiveness', 'expression',
     ARRAY['glamour', 'attractiveness', 'charm', 'radiance'],
     'Inner beauty reflects outward. Combine with self-care. Focus on confidence and self-acceptance.'),
    
    ('Justice', 'justice', 'Seeking fairness and legal success', 'protection',
     ARRAY['legal', 'fairness', 'truth', 'court'],
     'Use for legal matters, court cases, or seeking truth. Combine with truth-speaking and clarity work.'),
    
    ('Binding', 'binding', 'Restricting harmful actions or people', 'protection',
     ARRAY['restriction', 'limitation', 'prevention', 'stop'],
     'Ethical consideration required. Use only to prevent harm. Consider consequences carefully. Not for manipulation.'),
    
    ('Grounding', 'grounding', 'Connecting to earth energy and staying present', 'healing',
     ARRAY['centering', 'earthing', 'stability', 'presence'],
     'Essential after magical work. Walk barefoot, use stones, eat root vegetables. Return to physical awareness.'),
    
    ('Energy', 'energy', 'Increasing vitality and life force', 'healing',
     ARRAY['vitality', 'stamina', 'vigor', 'life force'],
     'Use for physical energy and magical power. Combine with proper rest, nutrition, and exercise.'),
    
    ('Focus', 'focus', 'Improving concentration and mental clarity', 'growth',
     ARRAY['concentration', 'attention', 'clarity', 'mindfulness'],
     'Use before study, work, or ritual. Eliminate distractions. Work with Air element for mental clarity.'),
    
    ('Clarity', 'clarity', 'Gaining clear vision and understanding', 'growth',
     ARRAY['clear vision', 'understanding', 'mental clarity', 'truth', 'insight'],
     'Use when seeking truth or understanding. Helps see through illusions and confusion. Excellent for decision-making.'),
    
    ('Dreams', 'dreams', 'Enhancing dream recall and lucid dreaming', 'spiritual',
     ARRAY['lucid dreaming', 'dream recall', 'oneiromancy', 'sleep magic'],
     'Keep dream journal by bed. Set intention before sleep. Use herbs under pillow. Record dreams immediately upon waking.'),
    
    ('Travel', 'travel', 'Safe and successful journeys', 'protection',
     ARRAY['journey', 'safe passage', 'adventure', 'protection'],
     'Use before trips for safety and smooth travel. Carry protective items. Set intentions for good experiences.'),
    
    ('Home', 'home', 'Blessing and protecting the home', 'protection',
     ARRAY['household', 'domestic', 'hearth', 'sanctuary'],
     'Create sacred space. Regular cleansing. Set wards. Make home a sanctuary. Use threshold magic.'),
    
    ('Hex Breaking', 'hex-breaking', 'Removing curses or negative magic', 'protection',
     ARRAY['curse removal', 'jinx breaking', 'uncrossing', 'reversal'],
     'Serious work requiring protection. Cleanse thoroughly before and after. May need repeated workings.'),
    
    -- Sabbat & Life Cycle Themes
    ('Death', 'death', 'Honoring endings, the cycle of life, and mortality', 'spiritual',
     ARRAY['endings', 'mortality', 'transition', 'afterlife', 'letting go'],
     'Honor the natural cycle of life and death. Work during Samhain. Face mortality with reverence. Release what must end.'),
    
    ('Ancestors', 'ancestors', 'Honoring and connecting with ancestral spirits', 'spiritual',
     ARRAY['lineage', 'family spirits', 'ancestral veneration', 'heritage'],
     'Build ancestor altar. Leave offerings. Learn family history. Honor those who came before. Work especially during Samhain.'),
    
    ('Reflection', 'reflection', 'Looking inward and contemplating life', 'spiritual',
     ARRAY['introspection', 'contemplation', 'self-examination', 'review'],
     'Set aside quiet time. Journal. Review past actions and choices. Prepare for new cycles. Work during waning moon.'),
    
    ('New Beginnings', 'new-beginnings', 'Starting fresh and embracing new starts', 'growth',
     ARRAY['fresh start', 'new chapter', 'initiation', 'dawn'],
     'Release the old to make space for the new. Set intentions. Work during new moon or Imbolc. Plant seeds for the future.'),
    
    ('Rebirth', 'rebirth', 'Renewal and starting anew after endings', 'growth',
     ARRAY['renewal', 'resurrection', 'revival', 'second chance'],
     'Work after major endings or during Yule/Ostara. Focus on emerging stronger. Phoenix energy.'),
    
    ('Purification', 'purification', 'Deep cleansing and making pure', 'protection',
     ARRAY['cleansing', 'sanctification', 'purging', 'baptism'],
     'Stronger than regular cleansing. Work during Imbolc. Use water, fire, or smoke. Prepare for sacred work.'),
    
    ('Renewal', 'renewal', 'Refreshing and revitalizing energy', 'healing',
     ARRAY['refresh', 'revitalize', 'restore', 'rejuvenate'],
     'Rest and restore. Take breaks. Reconnect with source. Work during spring or after intense periods.'),
    
    ('Passion', 'passion', 'Igniting intense emotion and desire', 'relationships',
     ARRAY['desire', 'fire', 'intensity', 'enthusiasm'],
     'Work during Beltane or waxing moon. Use fire element. Be clear about intentions. Ethical considerations apply.'),
    
    ('Vitality', 'vitality', 'Life force and vibrant energy', 'healing',
     ARRAY['life force', 'vigor', 'zest', 'aliveness'],
     'Cultivate energy and enthusiasm for life. Work during summer or waxing moon. Connect with sun energy.'),
    
    ('Union', 'union', 'Bringing together and sacred joining', 'relationships',
     ARRAY['joining', 'handfasting', 'partnership', 'merger'],
     'Work for partnerships, handfasting, or bringing elements together. Beltane energy. Balance and harmony.'),
    
    ('Power', 'power', 'Personal power and magical energy', 'growth',
     ARRAY['strength', 'force', 'potency', 'authority'],
     'Claim your personal power. Work during full moon or Litha. Use solar energy. Stand in your truth.'),
    
    ('Strength', 'strength', 'Inner fortitude and resilience', 'growth',
     ARRAY['fortitude', 'resilience', 'endurance', 'perseverance'],
     'Build inner strength. Face challenges. Work with Earth element. Develop staying power.'),
    
    ('Harvest', 'harvest', 'Reaping rewards and gathering abundance', 'abundance',
     ARRAY['reaping', 'gathering', 'rewards', 'culmination'],
     'Celebrate achievements. Gather what you''ve sown. Work during Lammas/Mabon. Give thanks for abundance.'),
    
    ('Gratitude', 'gratitude', 'Giving thanks and appreciation', 'healing',
     ARRAY['thankfulness', 'appreciation', 'blessing', 'recognition'],
     'Essential practice. Daily gratitude journaling. Work during harvest season. Amplifies all other work.'),
    
    ('Manifestation', 'manifestation', 'Bringing intentions into physical reality', 'abundance',
     ARRAY['creation', 'materialization', 'bringing forth', 'actualization'],
     'Combine visualization with action. Work during waxing/full moon. Be specific. Back magic with practical steps.'),
    
    ('Intention Setting', 'intention-setting', 'Clarifying and declaring goals', 'growth',
     ARRAY['goal setting', 'declaration', 'aim', 'purpose'],
     'Set clear, specific intentions. Write them down. Work during new moon. Review regularly.'),
    
    ('Planning', 'planning', 'Organizing and preparing for the future', 'growth',
     ARRAY['preparation', 'strategy', 'organization', 'foresight'],
     'Think ahead. Make plans. Use Air element for mental clarity. Work during waxing moon or new moon.'),
    
    ('Rest', 'rest', 'Restoration through stillness and retreat', 'healing',
     ARRAY['stillness', 'retreat', 'restoration', 'pause'],
     'Honor the need for rest. Work during waning/dark moon. Create restorative spaces. Necessary for growth.'),
    
    -- Entity-Specific Intentions (Candles, Chakras, etc.)
    ('Purity', 'purity', 'Spiritual cleanliness and innocence', 'spiritual',
     ARRAY['cleanliness', 'innocence', 'virginity', 'untainted'],
     'Use white candles and clear quartz. Focus on releasing impurities.'),
    ('Truth', 'truth', 'Seeking and speaking honesty', 'spiritual',
     ARRAY['honesty', 'authenticity', 'reality', 'veracity'],
     'Work with blue energy and throat chakra. Speak your truth with clarity.'),
    ('Absorbing Negativity', 'absorbing-negativity', 'Drawing in and neutralizing negative energy', 'protection', 
     ARRAY['absorb', 'neutralize', 'shield', 'negative energy'], 
     'Use with black candles and grounding stones. Visualize negativity being absorbed and transmuted.'),
    ('Emotional Healing', 'emotional-healing', 'Healing emotional wounds and trauma', 'healing',
     ARRAY['emotional', 'wounds', 'trauma', 'heart healing'],
     'Work gently with heart-centered practices. Combine with self-love and compassion work.'),
    ('Romance', 'romance', 'Romantic love and intimate relationships', 'relationships',
     ARRAY['romantic', 'intimate', 'dating', 'partnership'],
     'Focus on attracting or enhancing romantic connections. Use with Venus energy and rose quartz.'),
    ('Compassion', 'compassion', 'Cultivating empathy and kindness', 'relationships',
     ARRAY['empathy', 'kindness', 'understanding', 'mercy'],
     'Open your heart to others. Practice loving-kindness meditation.'),
    ('Intimacy', 'intimacy', 'Deep connection and closeness', 'relationships',
     ARRAY['closeness', 'connection', 'vulnerability', 'bonding'],
     'Open your heart. Allow vulnerability. Build trust and connection.'),
    ('Relationships', 'relationships', 'Connections with others', 'relationships',
     ARRAY['connection', 'partnership', 'bond', 'relating'],
     'Nurture connections. Practice open communication. Value your relationships.'),
    ('Forgiveness', 'forgiveness', 'Releasing resentment and pardoning', 'healing',
     ARRAY['pardon', 'release', 'letting go', 'mercy'],
     'Release grudges. Practice compassion. Let go of resentment.'),
    ('Money', 'money', 'Attracting financial abundance and currency', 'abundance',
     ARRAY['cash', 'currency', 'dollars', 'financial flow'],
     'Use green candles and citrine. Focus on specific monetary amounts or steady flow.'),
    ('Material Matters', 'material-matters', 'Physical world concerns and practical needs', 'abundance',
     ARRAY['practical', 'physical', 'material', 'tangible'],
     'Ground your work in earth energy. Focus on specific, tangible goals.'),
    ('Mental Clarity', 'mental-clarity', 'Clear thinking and mental focus', 'growth',
     ARRAY['clarity', 'mental', 'focus', 'clear mind'],
     'Use before important decisions or study. Combine with air element and yellow/blue colors.'),
    ('Joy', 'joy', 'Experiencing happiness and delight', 'emotional',
     ARRAY['happiness', 'delight', 'pleasure', 'celebration'],
     'Celebrate life. Work with sun energy and yellow/orange colors.'),
    ('Enthusiasm', 'enthusiasm', 'Energetic excitement and passion for life', 'emotional',
     ARRAY['excitement', 'passion', 'zest', 'vigor'],
     'Embrace your passions. Channel fire energy for motivation.'),
    ('Attraction', 'attraction', 'Drawing desired people, opportunities, or circumstances', 'abundance',
     ARRAY['magnetism', 'drawing', 'allure', 'pull'],
     'Focus on what you want to attract. Use visualization and positive energy.'),
    ('Ambition', 'ambition', 'Drive to achieve goals and succeed', 'growth',
     ARRAY['drive', 'determination', 'aspiration', 'goals'],
     'Set clear goals. Use with Mars energy and red/orange candles.'),
    ('Self Esteem', 'self-esteem', 'Valuing and respecting yourself', 'growth',
     ARRAY['self-worth', 'self-respect', 'confidence', 'value'],
     'Recognize your worth. Practice self-respect. Build confidence through action.'),
    ('Will', 'will', 'Personal willpower and determination', 'growth',
     ARRAY['willpower', 'determination', 'resolve', 'discipline'],
     'Exercise your will. Make conscious choices. Develop discipline.'),
    ('Expression', 'expression', 'Communicating thoughts and feelings', 'expression',
     ARRAY['communication', 'voice', 'articulation', 'sharing'],
     'Speak your truth. Express yourself freely. Use your voice.'),
    ('Authenticity', 'authenticity', 'Being genuine and true to yourself', 'spiritual',
     ARRAY['genuine', 'real', 'true self', 'integrity'],
     'Honor your truth. Be yourself. Live with integrity.'),
    ('Connection to Divine', 'connection-to-divine', 'Connecting with higher power or deity', 'spiritual',
     ARRAY['divine', 'deity', 'higher power', 'sacred connection'],
     'Create sacred space. Use during meditation or prayer. Work with devotional practices.'),
    ('Insight', 'insight', 'Deep understanding and perception', 'spiritual',
     ARRAY['understanding', 'realization', 'awareness', 'perception'],
     'Look within. Trust your inner knowing. Seek deeper understanding.'),
    ('Perception', 'perception', 'Awareness and interpretation', 'spiritual',
     ARRAY['awareness', 'sensing', 'observation', 'discernment'],
     'Expand awareness. Sharpen senses. Practice mindful observation.'),
    ('Spirituality', 'spirituality', 'Connection to spiritual practice and growth', 'spiritual',
     ARRAY['spiritual practice', 'devotion', 'faith', 'sacred'],
     'Dedicate regular time to spiritual work. Create sacred space.'),
    ('Enlightenment', 'enlightenment', 'Spiritual awakening and illumination', 'spiritual',
     ARRAY['awakening', 'illumination', 'realization', 'nirvana'],
     'Meditate regularly. Seek wisdom. Let go of attachments.'),
    ('Consciousness', 'consciousness', 'Awareness and presence', 'spiritual',
     ARRAY['awareness', 'presence', 'mindfulness', 'attention'],
     'Be present. Practice mindfulness. Expand your awareness.'),
    ('Unity', 'unity', 'Oneness and connection with all', 'spiritual',
     ARRAY['oneness', 'wholeness', 'connection', 'universal love'],
     'Recognize interconnection. Meditate on unity. Practice universal love.'),
    ('Transcendence', 'transcendence', 'Going beyond ordinary limits', 'spiritual',
     ARRAY['beyond', 'higher realm', 'spiritual ascension', 'elevation'],
     'Release limitations. Connect with higher consciousness. Seek spiritual elevation.'),
    ('Survival', 'survival', 'Basic needs and instincts for staying alive', 'protection',
     ARRAY['basic needs', 'instinct', 'preservation', 'safety'],
     'Ground yourself. Focus on meeting fundamental needs. Connect with earth element.'),
    ('Security', 'security', 'Feeling safe and protected', 'protection',
     ARRAY['safety', 'protection', 'shelter', 'stable'],
     'Create protective barriers. Build stable foundations. Work with grounding practices.'),
    ('Foundation', 'foundation', 'Building solid base and structure', 'grounding',
     ARRAY['base', 'structure', 'support', 'root'],
     'Start with basics. Build slowly and steadily. Create strong foundations.'),
    ('Stability', 'stability', 'Maintaining balance and steady state', 'grounding',
     ARRAY['balance', 'steady', 'equilibrium', 'anchored'],
     'Stay centered and grounded. Maintain routines. Build consistent practices.'),
    ('Sexuality', 'sexuality', 'Sexual energy and expression', 'relationships',
     ARRAY['sexual', 'sensual', 'desire', 'libido'],
     'Honor your body. Embrace sensuality. Work with sacral chakra and water element.'),
    ('Pleasure', 'pleasure', 'Experiencing joy and sensual delight', 'emotional',
     ARRAY['enjoyment', 'delight', 'sensual', 'satisfaction'],
     'Allow yourself to feel good. Embrace what brings you joy.'),
    ('Emotions', 'emotions', 'Feeling and expressing emotional states', 'emotional',
     ARRAY['feelings', 'emotional', 'sentiment', 'mood'],
     'Honor your feelings. Allow emotions to flow. Practice emotional awareness.'),
    ('Animals', 'animals', 'Working with and honoring animals', 'nature',
     ARRAY['pets', 'animal spirits', 'familiars', 'wildlife'],
     'Honor animal companions. Work with animal spirit guides.')
ON CONFLICT (slug) DO NOTHING;

