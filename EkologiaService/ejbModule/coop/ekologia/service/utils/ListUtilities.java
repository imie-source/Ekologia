package coop.ekologia.service.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.ejb.Stateless;

@Stateless
public class ListUtilities implements ListUtilitiesInterface {
	@Override
	public String mkString(Collection<?> collection, String separator) {
		StringBuilder result = new StringBuilder();
		int index = 0;
		int indexMax = collection.size();
		for (Object obj : collection) {
			result.append(obj.toString());
			
			index++;
			if (index < indexMax) {
				result.append(separator);
			}
		}
		return result.toString();
	}
	
	@Override
	public String mkString(Collection<?> collection, String prefix, String separator, String suffix) {
		return prefix + mkString(collection, separator) + suffix;
	}
	
	@Override
	public List<String> split(String str, String separator) {
		if (str == null) {
			return null;
		} else if (separator == null) {
			ArrayList<String> result = new ArrayList<String>();
			result.add(str);
			return result;
		} else {
			ArrayList<String> result = new ArrayList<String>();
			result.addAll(Arrays.asList(str.split(separator)));
			return result;
		}
	}
}
