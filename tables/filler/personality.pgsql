
COPY personalityquestions (id, question, weight, testname, flags, set) FROM stdin;
238	It is OK to break the law as long as nobody knows about it	1	personality	\N	2
239	I believe stealing is wrong	2	personality	\N	1
240	I have stolen small amounts of money in my last job	3	personality	\N	2
241	I am trusted to keep secrets	4	personality	\N	1
242	If I were sent an extra item with an order by mistake, I would  send it back.	5	personality	\N	1
243	I believe that honesty is the basis for trust	6	personality	\N	1
244	I keep my promises	7	personality	\N	1
245	I am true to my own values	8	personality	\N	1
246	I would lie to get myself out of trouble	9	personality	\N	2
247	I am hard to understand	10	personality	\N	2
248	I feel like an imposter	11	personality	\N	2
250	I always behave in a way that is socially appropriate.	13	personality	\N	1
251	I have never hurt anyone's feelings.	14	personality	\N	1
252	I read the  newspapers every single day.	15	personality	\N	1
253	I have never been late to a work meeting.	16	personality	\N	1
254	I have never thought about taking money at work when I had the chance.	17	personality	\N	1
255	I am the life of the party	18	personality	\N	1
256	I don't talk a lot	19	personality	\N	2
257	I keep in the background	20	personality	\N	2
258	I talk to a lot of different people at parties	21	personality	\N	1
259	I feel comfortable around people	22	personality	\N	1
260	I make friends easily	23	personality	\N	1
261	I am skilled at handling social situations	24	personality	\N	1
262	I am hard to get to know	25	personality	\N	2
263	I find it difficult to appropach others.	26	personality	\N	2
264	I have frequent mood swings	27	personality	\N	1
265	I am relaxed most of the time	28	personality	\N	2
266	I get upset easily	29	personality	\N	1
267	I seldom feel blue	30	personality	\N	2
268	I am not easily bothered by things	31	personality	\N	2
269	I panic easily	32	personality	\N	1
270	I feel threatened easily	33	personality	\N	1
271	I fear for the worst	34	personality	\N	1
272	I rarely get irritated	35	personality	\N	2
273	I sympathize with others' feelings.	36	personality	\N	1
274	I feel others' emotions	37	personality	\N	1
275	I am not really interested in others	38	personality	\N	2
276	I am not interested in other people's problems	39	personality	\N	2
277	I insult people	40	personality	\N	2
278	I feel little concern for others.	41	personality	\N	2
279	I make people feel at ease.	42	personality	\N	1
280	I inquire about others' well-being	43	personality	\N	1
281	I get chores done right away.	44	personality	\N	1
282	I often forget to put things back in their proper place	45	personality	\N	2
283	I like order	46	personality	\N	1
284	I make a mess of things	47	personality	\N	2
285	I am always prepared	48	personality	\N	1
286	I am exacting in my work	49	personality	\N	1
287	Find it difficult to get down to work	50	personality	\N	2
288	I neglect my duties.	51	personality	\N	2
289	I have a vivid imagination	52	personality	\N	1
290	I am not interested in abstract ideas	53	personality	\N	2
291	I have difficulty understanding abstract ideas	54	personality	\N	1
292	I do not have a good imagination	55	personality	\N	2
293	I enjoy hearing new ideas	56	personality	\N	1
294	I can carry the conversation to a higher level	57	personality	\N	1
295	I avoid philosophical discussions	58	personality	\N	2
249	I like to exaggerate my troubles	12	personality	\N	2
\.

SELECT pg_catalog.setval('personalityquestions_id_seq', 295, true);

ALTER TABLE ONLY personalityquestions
    ADD CONSTRAINT p_personalityquestions PRIMARY KEY (id);

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

SELECT pg_catalog.setval('personalityresponses_id_seq', 36, true);
ALTER TABLE ONLY personalityresponses
    ADD CONSTRAINT p_personalityresponses PRIMARY KEY (id);

