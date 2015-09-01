package ie.dit;

import java.util.*;

public class Main
{
    public static void main(String[] args)
    {       
        Scanner input = new Scanner(System.in);

        String needle = input.nextLine();
        String haystack = input.nextLine();

        LevenshteinDistance dist = new LevenshteinDistance(needle, haystack);

        int editDist = dist.distance();

        System.out.println(dist.matrix.toString());

        System.out.println("\nThe distance between \"" + needle + "\" and \"" + haystack + "\" is: " + editDist);
    }
}