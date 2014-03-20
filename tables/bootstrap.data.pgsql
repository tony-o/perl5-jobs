--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: tony
--

COPY roles (id, name) FROM stdin;
1	JOBVIEW
2	VIDEOREQ
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tony
--

SELECT pg_catalog.setval('roles_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: tony
--

COPY states (id, name) FROM stdin;
1	Alabama
2	Alaska
3	Arizona
4	Arkansas
5	California
6	Colorado
7	Connecticut
8	Delaware
9	Florida
10	Georgia
11	Hawaii
12	Idaho
13	Illinois
14	Indiana
15	Iowa
16	Kansas
17	Kentucky
18	Louisiana
19	Maine
20	Maryland
21	Massachusetts
22	Michigan
23	Minnesota
24	Mississippi
25	Missouri
26	Montana
27	Nebraska
28	Nevada
29	New Hampshire
30	New Jersey
31	New Mexico
32	New York
33	North Carolina
34	North Dakota
35	Ohio
36	Oklahoma
37	Oregon
38	Pennsylvania
39	Rhode Island
40	South Carolina
41	South Dakota
42	Tennessee
43	Texas
44	Utah
45	Vermont
46	Virginia
47	Washington
48	West Virginia
49	Wisconsin
50	Wyoming
\.


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tony
--

SELECT pg_catalog.setval('states_id_seq', 50, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: personalityquestions; Type: TABLE DATA; Schema: public; Owner: tony
--

COPY personalityquestions (id, question, weight, testname, flags, set) FROM stdin;
303	I am trusted to keep secrets	1	personality	Int	1
304	I am the life of the party	2	personality	Extr	1
305	I have frequent mood swings	3	personality	Neu	1
306	I sympathize with others' feelings	4	personality	Agr	1
307	I get chores done right away	5	personality	Con	1
308	I have a vivid imagination	6	personality	Op	1
309	Don't miss group meetings or team practices 	7	personality	To	1
310	Have difficulty starting tasks	8	personality	Pro	2
311	Don't approach things halfheartedly 	9	personality	Mot	1
312	Feel that I'm unable to deal with things	10	personality	Conf	2
313	I am trusted to keep secrets	1	personality	Int	1
314	I am the life of the party	2	personality	Extr	1
315	I have frequent mood swings	3	personality	Neu	1
316	I sympathize with others' feelings	4	personality	Agr	1
317	I get chores done right away	5	personality	Con	1
318	I have a vivid imagination	6	personality	Op	1
319	Don't miss group meetings or team practices 	7	personality	To	1
320	Have difficulty starting tasks	8	personality	Pro	2
321	Don't approach things halfheartedly 	9	personality	Mot	1
322	Feel that I'm unable to deal with things	10	personality	Conf	2
323	I believe that honesty is the basis for trust	11	personality	Int	1
324	I don't talk a lot	12	personality	Extr	2
325	I am relaxed most of the time	13	personality	Neu	2
326	I am not really interested in others	14	personality	Agr	2
327	I often forget to put things back in their proper place	15	personality	Con	2
328	I am not interested in abstract ideas	16	personality	Op	2
329	Enjoy being part of a group 	17	personality	To	1
330	Get things done right away	18	personality	Pro	1
331	Love what I do 	19	personality	Mot	1
332	Feel comfortable with myself	20	personality	Conf	1
333	I have never hurt anyone's feelings	21	personality	Fg	1
334	I keep my promises	22	personality	Int	1
335	I keep in the background	23	personality	Extr	2
336	I seldom feel depressed	24	personality	Neu	2
337	I make people feel at ease	25	personality	Agr	1
338	I like order	26	personality	Con	1
339	Prefer to do everything alone	27	personality	To	2
340	Get tasks done quickly	28	personality	Pro	1
341	Look forward to each new day	29	personality	Mot	1
342	Dislike myself	30	personality	Conf	2
343	True to my own values	31	personality	Int	1
344	Have never thought about taking money at work when I had the chance	32	personality	Fg	1
345	Just know that I will be a success	33	personality	Conf	1
346	Talk to a lot of different people at parties	34	personality	Extr	1
347	Am not easily bothered by things	35	personality	Neu	2
348	Am not interested in other people's problems	36	personality	Agr	2
349	Make a mess of things	37	personality	Con	2
350	Do not have a good imagination	38	personality	Op	2
351	Support my teammates or fellow group members 	39	personality	To	1
352	Plunge into tasks with all my heart	40	personality	Pro	1
353	Dread getting up in the morning	41	personality	Mot	2
354	Am less capable than most people	42	personality	Conf	2
355	I have difficulty understanding abstract ideas	43	personality	Op	1
356	Would lie to get myself out of trouble	44	personality	Int	2
357	Feel comfortable around people	45	personality	Extr	1
358	Panic easily	46	personality	Neu	1
359	Inquire about others' well-being	47	personality	Agr	1
360	Am always prepared	48	personality	Con	1
361	Enjoy hearing new ideas	49	personality	Op	1
362	Am not good at working with a group 	50	personality	To	2
363	Need a push to get started	51	personality	Pro	2
364	Can’t wait to get started on a project 	52	personality	Mot	1
365	Like to take responsibility for making decisions	53	personality	Conf	1
366	Put off unpleasant tasks	54	personality	Pro	2
367	Always behave in a way that is socially appropriate	55	personality	Fg	1
368	Make friends easily	56	personality	Extr	1
369	Feel threatened easily	57	personality	Neu	1
370	Insult people	58	personality	Agr	2
371	Am exacting in my work	59	personality	Con	1
372	Feel I must respect the decisions made by my group 	60	personality	To	1
373	Finish tasks quickly	61	personality	Pro	1
374	Feel like an imposter	62	personality	Int	2
375	Am hard to get to know	63	personality	Extr	2
376	Fear for the worst	64	personality	Neu	1
377	Can carry the conversation to a higher level	65	personality	Op	1
378	Work best when I am alone	66	personality	To	2
379	Awaken with a sense of excitement about the day's possibilities	67	personality	Mot	1
380	Know my strengths	68	personality	Conf	1
381	Have never been late to a work meeting	69	personality	Fg	1
382	Find it difficult to appropach others	70	personality	Extr	2
383	Rarely get irritated	71	personality	Neu	2
384	Feel little concern for others	72	personality	Agr	2
385	Neglect my duties	73	personality	Con	2
386	Avoid philosophical discussions	74	personality	Op	2
387	Keep to myself	75	personality	To	2
388	Find it difficult to get down to work	76	personality	Con	2
389	Don't have much energy	77	personality	Mot	2
390	Feel that my life lacks direction	78	personality	Conf	2
\.


--
-- Name: personalityquestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tony
--

SELECT pg_catalog.setval('personalityquestions_id_seq', 390, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: personalityresponses; Type: TABLE DATA; Schema: public; Owner: tony
--

COPY personalityresponses (id, response, weight, testname, set, fval) FROM stdin;
23	Disagree Strongly	1	personality	1	1
24	Disagree Moderately	2	personality	1	2
25	Disagree a Little	3	personality	1	3
26	Neither Agree nor Disagree	4	personality	1	4
27	Agree a Little	5	personality	1	5
28	Agree Moderately	6	personality	1	6
29	Agree Strongly	7	personality	1	7
30	Disagree Strongly	1	personality	2	7
31	Disagree Moderately	2	personality	2	6
32	Disagree a Little	3	personality	2	5
33	Neither Agree nor Disagree	4	personality	2	4
34	Agree a Little	5	personality	2	3
35	Agree Moderately	6	personality	2	2
36	Agree Strongly	7	personality	2	1
\.


--
-- Name: personalityresponses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tony
--

SELECT pg_catalog.setval('personalityresponses_id_seq', 36, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: bioquestions; Type: TABLE DATA; Schema: public; Owner: tony
--

COPY bioquestions (id, question, weight, coltype, linkedinmeta) FROM stdin;
3	Contact Number	\N	T	\N
1	First Name	\N	T	first-name
2	Last Name	\N	T	last-name
4	Sell yourself in 500 characters	\N	a	summary
\.


--
-- Name: bioquestions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tony
--

SELECT pg_catalog.setval('bioquestions_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: degreetypes; Type: TABLE DATA; Schema: public; Owner: tony
--

COPY degreetypes (did, name) FROM stdin;
1	Professional Certification
2	Associate Degree
3	Bachelor of Arts
4	Bachelor of Science
5	Bachelor of Business Administration
6	Master of Arts
7	Master of Science
8	Master of Business Administration
9	Doctor of Philosophy
10	Doctor of Education
11	Juris Doctor
\.


--
-- Name: degreetypes_did_seq; Type: SEQUENCE SET; Schema: public; Owner: tony
--

SELECT pg_catalog.setval('degreetypes_did_seq', 11, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: jobclasses; Type: TABLE DATA; Schema: public; Owner: tony
--

COPY jobclasses (jid, name, isheader) FROM stdin;
201	Accounting	f
202	Administrative Support	f
203	Banking/Real Estate/Mortgage Professionals	f
204	Biotech/Science	f
205	Building Construction/Skilled Trades	f
206	Business/Strategic Management and Administration	f
207	Creative/Design	f
208	Customer Support/Client Care	f
209	Editorial/Writing/Journalism	f
210	Education/Training	f
211	Engineering	f
212	Executive Level	f
213	Food Services/Hospitality	f
214	Human Resources	f
215	Installation/Maintenance/Repair	f
216	IT/Software Development	f
217	IT/Network Administration/Management	f
218	Legal	f
219	Logistics/Transportation	f
220	Management, People	f
221	Manufacturing/Production/Operations	f
222	Marketing/Promotion	f
223	Medical/Health	f
224	Project/Program Management	f
225	Quality Assurance/Safety	f
226	Sales/Retail/Business Development	f
227	Security/Protective Services	f
\.


--
-- Name: jobclasses_jid_seq; Type: SEQUENCE SET; Schema: public; Owner: tony
--

SELECT pg_catalog.setval('jobclasses_jid_seq', 227, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: jobmatchtraits; Type: TABLE DATA; Schema: public; Owner: tony
--

COPY jobmatchtraits (id, name, flags) FROM stdin;
1	Integrity	Int
2	Extraversion	Extr
3	Neuroticism	Neu
4	Agreeableness	Agr
5	Conscientiousness	Con
6	Openness	Op
7	Team Orientation	To
8	Proactivity	Pro
9	Motivation	Mot
10	Confidence	Conf
\.


--
-- Name: jobmatchtraits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tony
--

SELECT pg_catalog.setval('jobmatchtraits_id_seq', 10, true);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: job_reqs_precanned; Type: TABLE DATA; Schema: public; Owner: tony
--

COPY job_reqs_precanned (id, jmtid, jid, value, version) FROM stdin;
1	1	201	80	1
2	2	201	40	1
3	3	201	25	1
4	4	201	80	1
5	5	201	80	1
6	6	201	80	1
7	7	201	40	1
8	8	201	60	1
9	9	201	60	1
10	10	201	50	1
11	1	202	80	1
12	2	202	70	1
13	3	202	25	1
14	4	202	80	1
15	5	202	60	1
16	6	202	80	1
17	7	202	80	1
18	8	202	80	1
19	9	202	80	1
20	10	202	70	1
21	1	203	80	1
22	2	203	80	1
23	3	203	80	1
24	4	203	70	1
25	5	203	80	1
26	6	203	60	1
27	7	203	50	1
28	8	203	80	1
29	9	203	80	1
30	10	203	80	1
31	1	204	80	1
32	2	204	50	1
33	3	204	25	1
34	4	204	80	1
35	5	204	80	1
36	6	204	80	1
37	7	204	80	1
38	8	204	80	1
39	9	204	80	1
40	10	204	80	1
41	1	205	60	1
42	2	205	40	1
43	3	205	25	1
44	4	205	60	1
45	5	205	70	1
46	6	205	50	1
47	7	205	70	1
48	8	205	80	1
49	9	205	80	1
50	10	205	70	1
51	1	206	80	1
52	2	206	80	1
53	3	206	80	1
54	4	206	70	1
55	5	206	80	1
56	6	206	60	1
57	7	206	50	1
58	8	206	80	1
59	9	206	80	1
60	10	206	80	1
61	1	207	60	1
62	2	207	50	1
63	3	207	75	1
64	4	207	60	1
65	5	207	80	1
66	6	207	80	1
67	7	207	50	1
68	8	207	60	1
69	9	207	60	1
70	10	207	60	1
71	1	208	60	1
72	2	208	80	1
73	3	208	25	1
74	4	208	80	1
75	5	208	60	1
76	6	208	80	1
77	7	208	70	1
78	8	208	50	1
79	9	208	70	1
80	10	208	50	1
81	1	209	80	1
82	2	209	60	1
83	3	209	40	1
84	4	209	80	1
85	5	209	80	1
86	6	209	60	1
87	7	209	40	1
88	8	209	80	1
89	9	209	80	1
90	10	209	70	1
91	1	210	80	1
92	2	210	80	1
93	3	210	30	1
94	4	210	75	1
95	5	210	80	1
96	6	210	75	1
97	7	210	80	1
98	8	210	60	1
99	9	210	70	1
100	10	210	70	1
101	1	211	80	1
102	2	211	50	1
103	3	211	25	1
104	4	211	80	1
105	5	211	80	1
106	6	211	80	1
107	7	211	80	1
108	8	211	80	1
109	9	211	80	1
110	10	211	80	1
111	1	212	60	1
112	2	212	85	1
113	3	212	70	1
114	4	212	60	1
115	5	212	60	1
116	6	212	60	1
117	7	212	75	1
118	8	212	85	1
119	9	212	85	1
120	10	212	90	1
121	1	213	60	1
122	2	213	80	1
123	3	213	25	1
124	4	213	80	1
125	5	213	60	1
126	6	213	80	1
127	7	213	70	1
128	8	213	50	1
129	9	213	70	1
130	10	213	50	1
131	1	214	60	1
132	2	214	60	1
133	3	214	25	1
134	4	214	80	1
135	5	214	70	1
136	6	214	80	1
137	7	214	80	1
138	8	214	60	1
139	9	214	60	1
140	10	214	50	1
141	1	215	60	1
142	2	215	40	1
143	3	215	25	1
144	4	215	60	1
145	5	215	70	1
146	6	215	50	1
147	7	215	70	1
148	8	215	80	1
149	9	215	80	1
150	10	215	70	1
151	1	216	80	1
152	2	216	50	1
153	3	216	25	1
154	4	216	80	1
155	5	216	80	1
156	6	216	80	1
157	7	216	80	1
158	8	216	80	1
159	9	216	80	1
160	10	216	80	1
161	1	217	80	1
162	2	217	50	1
163	3	217	25	1
164	4	217	80	1
165	5	217	80	1
166	6	217	80	1
167	7	217	80	1
168	8	217	80	1
169	9	217	80	1
170	10	217	80	1
171	1	218	80	1
172	2	218	60	1
173	3	218	25	1
174	4	218	80	1
175	5	218	70	1
176	6	218	80	1
177	7	218	80	1
178	8	218	80	1
179	9	218	80	1
180	10	218	75	1
181	1	219	60	1
182	2	219	40	1
183	3	219	25	1
184	4	219	60	1
185	5	219	70	1
186	6	219	50	1
187	7	219	70	1
188	8	219	80	1
189	9	219	80	1
190	10	219	70	1
191	1	220	80	1
192	2	220	60	1
193	3	220	25	1
194	4	220	70	1
195	5	220	80	1
196	6	220	75	1
197	7	220	80	1
198	8	220	80	1
199	9	220	80	1
200	10	220	80	1
201	1	221	60	1
202	2	221	40	1
203	3	221	25	1
204	4	221	60	1
205	5	221	70	1
206	6	221	50	1
207	7	221	70	1
208	8	221	80	1
209	9	221	80	1
210	10	221	70	1
211	1	222	80	1
212	2	222	90	1
213	3	222	80	1
214	4	222	60	1
215	5	222	60	1
216	6	222	60	1
217	7	222	70	1
218	8	222	80	1
219	9	222	80	1
220	10	222	90	1
221	1	223	80	1
222	2	223	70	1
223	3	223	25	1
224	4	223	80	1
225	5	223	60	1
226	6	223	80	1
227	7	223	80	1
228	8	223	80	1
229	9	223	80	1
230	10	223	70	1
231	1	224	80	1
232	2	224	60	1
233	3	224	25	1
234	4	224	70	1
235	5	224	80	1
236	6	224	75	1
237	7	224	80	1
238	8	224	80	1
239	9	224	80	1
240	10	224	80	1
241	1	225	60	1
242	2	225	80	1
243	3	225	25	1
244	4	225	80	1
245	5	225	60	1
246	6	225	80	1
247	7	225	70	1
248	8	225	50	1
249	9	225	70	1
250	10	225	50	1
251	1	226	60	1
252	2	226	80	1
253	3	226	80	1
254	4	226	70	1
255	5	226	60	1
256	6	226	60	1
257	7	226	50	1
258	8	226	80	1
259	9	226	80	1
260	10	226	80	1
261	1	227	80	1
262	2	227	80	1
263	3	227	25	1
264	4	227	80	1
265	5	227	60	1
266	6	227	80	1
267	7	227	70	1
268	8	227	50	1
269	9	227	70	1
270	10	227	50	1
\.


--
-- Name: job_reqs_precanned_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tony
--

SELECT pg_catalog.setval('job_reqs_precanned_id_seq', 270, true);


--
-- PostgreSQL database dump complete
--

