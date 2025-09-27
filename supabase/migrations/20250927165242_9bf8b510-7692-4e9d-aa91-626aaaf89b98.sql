-- Create RLS policies for internships table to allow public read access
-- Since internship listings should be publicly viewable by all users

CREATE POLICY "Allow public read access to internships" 
ON public.internships 
FOR SELECT 
USING (true);

-- If we want to allow companies to insert internships in the future
CREATE POLICY "Allow authenticated users to insert internships" 
ON public.internships 
FOR INSERT 
WITH CHECK (auth.uid() IS NOT NULL);

-- Allow authenticated users to update their own internships
CREATE POLICY "Allow authenticated users to update internships" 
ON public.internships 
FOR UPDATE 
USING (auth.uid() IS NOT NULL);

-- Add some sample data if table is empty or needs more diverse examples
INSERT INTO public.internships (
  title, organization, location, start_date, duration, sector, skills, perks, source, stipend
) VALUES 
(
  'Product Management Intern',
  'Zomato',
  'Gurgaon',
  'January 2025',
  '6 months',
  'Food Tech',
  'product strategy, market research, analytics, user research',
  'mentorship, team events, flexible hours',
  'Company Website',
  '₹ 25,000 /month'
),
(
  'PM Strategy Intern',
  'Paytm',
  'Bangalore',
  '1st December 2024',
  '4 months',
  'Fintech',
  'product management, data analysis, user experience, strategy',
  'startup environment, career development, networking',
  'Internshala',
  '₹ 20,000 /month'
),
(
  'Product Analyst Intern',
  'Flipkart',
  'Bangalore',
  'February 2025',
  '5 months',
  'E-commerce',
  'analytics, sql, python, product metrics, a/b testing',
  'mentorship, team events, certification',
  'Portal',
  '₹ 30,000 /month'
),
(
  'Growth Product Intern',
  'Swiggy',
  'Mumbai',
  'January 2025',
  '3 months',
  'Food Delivery',
  'growth hacking, product analytics, user acquisition, conversion optimization',
  'flexible hours, startup culture',
  'Company Website',
  '₹ 22,000 /month'
),
(
  'Product Development Intern',
  'BYJU''S',
  'Bangalore',
  'March 2025',
  '6 months',
  'EdTech',
  'product development, user research, market analysis, agile methodology',
  'mentorship, career development, flexible work',
  'Internshala',
  '₹ 18,000 /month'
)
ON CONFLICT DO NOTHING;